import 'package:flutter/material.dart';
import 'package:my_app/core/localization/app_localization.dart';
import 'package:my_app/pages/base/base_page.dart';
import 'package:my_app/pages/main/settings/settings_view_model.dart';

class SettingsPage extends BasePage<SettingsViewModel> {
  const SettingsPage({super.key, required super.viewModel});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends BasePageState<SettingsPage> {
  @override
  String? get title => AppLocalization.of(context).settings;

  @override
  void bind() {}

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget buildBody(BuildContext context) {
    final localization = AppLocalization.of(context);

    return ListView(
      children: [
        SwitchListTile(
          secondary: const Icon(Icons.language),
          title: Text(localization.language),
          subtitle: Text(
            widget.viewModel.isEnglish
                ? localization.english
                : localization.japanese,
          ),
          value: widget.viewModel.isEnglish,
          onChanged: widget.viewModel.changeLanguage,
        ),
        StreamBuilder<int>(
          stream: widget.viewModel.countChanged,
          initialData: widget.viewModel.count,
          builder: (context, snapshot) {
            return ListTile(
              title: const Text('Count'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    tooltip: 'Decrease count',
                    onPressed: widget.viewModel.decrementCount,
                    icon: const Icon(Icons.remove),
                  ),
                  SizedBox(
                    width: 40,
                    child: Text(
                      '${snapshot.data ?? 0}',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  IconButton(
                    tooltip: 'Increase count',
                    onPressed: widget.viewModel.incrementCount,
                    icon: const Icon(Icons.add),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
