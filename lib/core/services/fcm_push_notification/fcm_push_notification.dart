// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'dart:io';

import 'package:dartx/dartx.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:my_app/core/services/fcm_push_notification/fcm_push_notification_delegate.dart';
import 'package:my_app/core/utils/helpers/dp_disposable.dart';
import 'package:my_app/firebase_options.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rxdart/rxdart.dart';

@singleton
class FCMPushNotification with DPDisposable {
  FCMPushNotificationDelegate delegate = FCMPushNotificationAction();

  final _channel = const AndroidNotificationChannel(
    'high_importance_channel', // id
    'Petshop', // title
    description: 'App Notification Channel', // description
    importance: Importance.max,
  );

  static final _backgroundMessage = PublishSubject<RemoteMessage>();
  final onNotification = PublishSubject<RemoteMessage>();
  static final onNotificationBackground = _backgroundMessage;
  final onTapHeadUpNotificationSubject = PublishSubject<Map<String, dynamic>>();

  final _plugin = FlutterLocalNotificationsPlugin();

  FCMPushNotification() {
    _init();
  }

  Future<String?> getDeviceToken() => FirebaseMessaging.instance.getToken();

  Future<void> _init() async {
    if (Firebase.apps.isEmpty) {
      try {
        await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
        if (kDebugMode) {
          await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(false);
        }
        await Permission.notification.request();
      } catch (exception) {
        debugPrint(exception.toString());
      }
    }
    FirebaseMessaging.instance.onTokenRefresh.listen((fcmToken) => delegate.onTokenRefresh(fcmToken));

    _setupCrashlytics();

    await _setupLocalNotification();

    _setupHandler();

    _backgroundMessage.debounceTime(const Duration(milliseconds: 400)).listen((message) {}).canceledBy(this);
  }

  void generatorToken() async {
    final token = await getDeviceToken() ?? '';
    delegate.onTokenRefresh(token);
  }

  void refresh() async {
    try {
      final token = await getDeviceToken() ?? '';
      delegate.onTokenRefresh(token);
    } catch (exception) {}
  }

  void _setupHandler() {
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      if (event.notification != null) {
        String title = event.notification?.title ?? '';
        String body = event.notification?.body ?? '';

        Map<String, dynamic> notificationData = {
          'title': title,
          'body': body,
        };

        delegate.onMessageOpenedApp(notificationData, (data) {
          onTapHeadUpNotificationSubject.add(data);
        });
      }
    });
  }

  void initMessageOpenApp() {
    FirebaseMessaging.instance.getInitialMessage().then((event) {
      if (event?.notification != null) {
        String title = event?.notification?.title ?? '';
        String body = event?.notification?.body ?? '';

        Map<String, dynamic> notificationData = {
          'title': title,
          'body': body,
        };

        delegate.onMessageOpenedApp(notificationData, (data) {
          onTapHeadUpNotificationSubject.add(data);
        });
      }
    });

    _plugin.getNotificationAppLaunchDetails().then((value) {
      if (value != null && value.didNotificationLaunchApp == true) {
        final data = jsonDecode(value.notificationResponse?.payload ?? '');
        delegate.onMessageOpenedApp(data, (data) {
          onTapHeadUpNotificationSubject.add(data);
        });
      }
    });
  }

  Future<void> requestPermission() async {
    if (Platform.isIOS) {
      FirebaseMessaging messaging = FirebaseMessaging.instance;
      await messaging.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );
    }
  }

  Future<String> _base64encodedImage(String url) async {
    final http.Response response = await http.get(Uri.parse(url));
    final String base64Data = base64Encode(response.bodyBytes);
    return base64Data;
  }

  Future<void> _showPublicNotification(
      AndroidNotification? android, RemoteMessage message, RemoteNotification notification) async {
    final largeIcon = android?.imageUrl?.isEmpty == false ? await _base64encodedImage(android?.imageUrl ?? "") : null;

    final androidNotificationDetails = AndroidNotificationDetails(
      _channel.id,
      _channel.name,
      channelDescription: _channel.description,
      importance: Importance.max,
      priority: Priority.high,
      channelShowBadge: true,
      largeIcon: largeIcon == null ? null : ByteArrayAndroidBitmap.fromBase64String(largeIcon),
      styleInformation: largeIcon == null
          ? null
          : BigPictureStyleInformation(
              ByteArrayAndroidBitmap.fromBase64String(largeIcon),
              contentTitle: notification.title,
              htmlFormatContentTitle: true,
              hideExpandedLargeIcon: true,
              summaryText: notification.body,
              htmlFormatSummaryText: true,
            ),
      visibility: NotificationVisibility.public,
    );

    Map<String, dynamic> notificationData = {
      'title': message.notification?.title ?? '',
      'body': message.notification?.body ?? '',
    };
    await _plugin.show(
      notification.hashCode,
      notification.title,
      notification.body,
      NotificationDetails(
        android: androidNotificationDetails,
        iOS: DarwinNotificationDetails(
          presentAlert: true,
          presentSound: true,
          presentBadge: true,
          badgeNumber: message.notification?.apple?.badge?.toInt(),
        ),
      ),
      payload: jsonEncode(notificationData),
    );
  }

  Future<void> _setupLocalNotification() async {
    // Apple
    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    await _plugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(_channel);

    await _plugin
        .resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(sound: true, alert: true, badge: true);

    await _plugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();

    const initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');

    const iosSettings = DarwinInitializationSettings();

    const initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: iosSettings,
    );

    await _plugin.initialize(initializationSettings, onDidReceiveNotificationResponse: (response) {
      try {
        final data = jsonDecode(response.payload ?? '');
        delegate.onMessageOpenedApp(data, (data) {
          onTapHeadUpNotificationSubject.add(data);
        });
      } finally {}
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      // If `onMessage` is triggered with a notification, construct our own
      // local notification to show to users using the created channel.
      delegate.onSetStatusNotification(message.data);
      if (notification != null) {
        onNotification.add(message);
        if (Platform.isAndroid) {
          _showPublicNotification(android, message, notification);
        }
      } else {
        _backgroundMessage.add(message);
      }
    });
    FirebaseMessaging.onBackgroundMessage(onBackgroundNotification);
  }

  static Future<void> onBackgroundNotification(RemoteMessage message) async {
    _backgroundMessage.add(message);
  }

  void _setupCrashlytics() {
    // Pass all uncaught "fatal" errors from the framework to Crashlytics
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

    // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };
  }
}
