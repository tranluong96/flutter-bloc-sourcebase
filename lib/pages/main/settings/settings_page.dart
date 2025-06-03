import 'package:flutter/material.dart';
import 'package:my_app/pages/base/base_page.dart';
import 'package:my_app/pages/main/settings/settings_view_model.dart';

class SettingsPage extends BasePage<SettingsViewModel> {
  const SettingsPage({super.key, required super.viewModel});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends BasePageState<SettingsPage> {
  @override
  String? get title => "Settings";

  @override
  void bind() {
    // TODO: implement bind
  }

  @override
  Widget buildBody(BuildContext context) {
    return Container();
  }
}
