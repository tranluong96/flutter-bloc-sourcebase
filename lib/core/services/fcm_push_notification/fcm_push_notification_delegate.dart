abstract class FCMPushNotificationDelegate {
  void onSetStatusNotification(Map<String, dynamic> data);

  void onMessageOpenedApp(
    Map<String, dynamic> data,
    void Function(Map<String, dynamic>)? headsUpNotification,
  );

  void onTokenRefresh(String token);
}

class FCMPushNotificationAction extends FCMPushNotificationDelegate {
  @override
  void onMessageOpenedApp(Map<String, dynamic> data, void Function(Map<String, dynamic>)? headsUpNotification) {
    final String? notiLocalTitle = data['title'];
    final String? notiLocalBody = data['body'];
  }

  @override
  void onTokenRefresh(String token) {}

  @override
  void onSetStatusNotification(Map<String, dynamic> data) {}
}
