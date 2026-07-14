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
    // TODO: xử lý khi người dùng mở app từ notification (điều hướng theo `data`).
    // Ví dụ: headsUpNotification?.call(data);
  }

  @override
  void onTokenRefresh(String token) {}

  @override
  void onSetStatusNotification(Map<String, dynamic> data) {}
}
