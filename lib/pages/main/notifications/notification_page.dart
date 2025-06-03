import 'package:flutter/material.dart';
import 'package:my_app/pages/base/base_page.dart';
import 'package:my_app/pages/main/notifications/notification_view_model.dart';

class NotificationPage extends BasePage<NotificationViewModel> {
  const NotificationPage({super.key, required super.viewModel});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends BasePageState<NotificationPage> {
  @override
  String? get title => "Notifications";

  @override
  Widget buildBody(BuildContext context) {
    return Container();
  }

  @override
  void bind() {
    // TODO: implement bind
  }
}
