import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:my_app/core/localization/app_localization.dart';
import 'package:my_app/core/resources/res.dart';
import 'package:my_app/core/shared/global_overlay/global_ui.dart';
import 'package:my_app/core/utils/extensions/modal_extensions.dart';
import 'package:my_app/core/utils/helpers/logger_helper/logger_helper.dart';
import 'package:my_app/generated/di/di.dart';
import 'package:my_app/pages/base/base_page_mixin.dart';
import 'package:my_app/pages/main/home/bloc/home_bloc.dart';
import 'package:my_app/pages/main/home/bloc/home_state.dart';
import 'package:my_app/pages/widgets/buttons/outline_button.dart';
import 'package:my_app/pages/widgets/buttons/primary_button.dart';
import 'package:my_app/pages/widgets/buttons/switch_button.dart';
import 'package:my_app/pages/widgets/text_form_field/text_form_field_custom.dart';
import 'package:my_app/routes/router.gr.dart';

@RoutePage()
class HomePage extends StatefulWidget implements AutoRouteWrapper {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (context) => HomeBloc(), child: this);
  }
}

class _HomePageState extends State<HomePage> with BasePageMixin {
  HomeBloc get _bloc => context.read<HomeBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: _bloc,
      listener: (context, state) {
        switch (state.status) {
          case HomeStatus.loading:
            GlobalUi.showLoading();
            break;
          case HomeStatus.loaded:
            GlobalUi.hideLoading();
            break;
          case HomeStatus.error:
            GlobalUi.hideLoading();
            GlobalUi.showError('Something went wrong');
            _bloc.resetState();
            break;
          default:
            break;
        }
      },
      builder: (context, state) => buildPage(context),
    );
  }

  @override
  String? get title => AppLocalization.of(context).home;

  @override
  void initState() {
    super.initState();
    _bloc.init();
    _bloc.initLanguage(AppLocalization.isEnglish);
  }

  // show alert dialog
  void _showAlertDialog(BuildContext context) async {
    await context.showAlertDialog(
      message: 'This is a clear boilerplate alert dialog demonstrating modal extensions.',
      title: 'Alert Dialog',
    );
  }

  // show confirm dialog
  void _showConfirm(BuildContext context) async {
    final result = await context.showConfirmDialog(
      message: 'Are you sure you want to proceed with this action?',
      title: 'Confirmation Required',
      confirmText: 'Yes, proceed',
      cancelText: 'Cancel',
    );
    if (result) {
      getIt<LoggerHelper>().info('User confirmed');
    }
  }

  // show action sheet
  void _showActionSheet(BuildContext context) async {
    final result = await context.showActionBottomSheet<String>(
      title: 'Boilerplate Options',
      items: [
        const ActionSheetItem(
          title: 'Favorite Option',
          value: 'favorite',
          icon: Icons.favorite_border,
        ),
        const ActionSheetItem(
          title: 'Star Option',
          value: 'star',
          icon: Icons.star_border,
        ),
        const ActionSheetItem(
          title: 'Delete Option',
          value: 'delete',
          icon: Icons.delete_outline,
          isDestructive: true,
        ),
      ],
      cancelText: 'Cancel',
    );
    if (result != null) {
      getIt<LoggerHelper>().info('Selected option: $result');
    }
  }

  Widget _buildSectionCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required Widget child,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: ResColors().white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(
          color: ResColors().strokeAppbar,
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: ResColors().primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    icon,
                    color: ResColors().primary,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: ResTextStyles().medium16.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        subtitle,
                        style: ResTextStyles().regular14.copyWith(
                              color: Colors.grey[600],
                              fontSize: 12,
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Divider(height: 24, thickness: 1),
            child,
          ],
        ),
      ),
    );
  }

  Widget _buildToastTriggerButton({
    required VoidCallback onPressed,
    required String label,
    required Color color,
  }) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: color.withOpacity(0.1),
        foregroundColor: color,
        elevation: 0,
        side: BorderSide(color: color.withOpacity(0.3)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      ),
      onPressed: onPressed,
      icon: Icon(_getIconForLabel(label), size: 16),
      label: Text(
        label,
        style: ResTextStyles().medium16.copyWith(
              color: color,
              fontSize: 14,
            ),
      ),
    );
  }

  IconData _getIconForLabel(String label) {
    switch (label.toLowerCase()) {
      case 'success':
        return Icons.check_circle_outline;
      case 'error':
        return Icons.error_outline;
      case 'warning':
        return Icons.warning_amber_rounded;
      default:
        return Icons.info_outline;
    }
  }

  @override
  Widget buildBody(BuildContext context) {
    return Container(
      color: Colors.grey[50],
      child: SingleChildScrollView(
        child: Column(
          children: [
            // Top App Banner
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    ResColors().primary,
                    ResColors().secondary,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Dipro App Base",
                        style: ResTextStyles().medium16.copyWith(
                              color: ResColors().white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: ResColors().white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          "v1.0.0",
                          style: ResTextStyles().regular14.copyWith(
                                color: ResColors().white,
                                fontSize: 12,
                              ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Icon(
                        Icons.link,
                        color: ResColors().white.withOpacity(0.8),
                        size: 16,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          "URL BASE: ${dotenv.env['BASE_URL']}",
                          style: ResTextStyles().regular14.copyWith(
                                color: ResColors().white.withOpacity(0.9),
                                fontSize: 13,
                              ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Content cards
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  // 1. Localization Settings Card
                  _buildSectionCard(
                    title: "Localization & Environment",
                    subtitle: "Toggle and manage multi-language support",
                    icon: Icons.language,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Active Language: ${_bloc.state.isEnglish ? 'English' : 'Japanese'}",
                              style: ResTextStyles().medium16.copyWith(fontSize: 14),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "Local change updates state instantly",
                              style: ResTextStyles().regular14.copyWith(
                                    color: Colors.grey[500],
                                    fontSize: 12,
                                  ),
                            ),
                          ],
                        ),
                        SwitchButton(
                          value: _bloc.state.isEnglish,
                          onChanged: (value) {
                            _bloc.toggleLanguage(value);
                            AppLocalization.changeLanguage(value ? 'en' : 'ja');
                          },
                        ),
                      ],
                    ),
                  ),

                  // 2. State Management & Navigation Card
                  _buildSectionCard(
                    title: "State Management (BLoC)",
                    subtitle: "Reactive counter streams and flow controls",
                    icon: Icons.track_changes,
                    child: StreamBuilder<int>(
                      stream: _bloc.countChanged,
                      builder: (context, asyncSnapshot) {
                        final currentCount = asyncSnapshot.data ?? 0;
                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () => _bloc.decrementCount(),
                                  borderRadius: BorderRadius.circular(20),
                                  child: Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: Colors.grey[100],
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(Icons.remove, size: 20),
                                  ),
                                ),
                                const SizedBox(width: 32),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 24,
                                    vertical: 12,
                                  ),
                                  decoration: BoxDecoration(
                                    color: ResColors().primary.withOpacity(0.05),
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: ResColors().primary.withOpacity(0.2),
                                    ),
                                  ),
                                  child: Text(
                                    "$currentCount",
                                    style: ResTextStyles().medium16.copyWith(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: ResColors().primary,
                                        ),
                                  ),
                                ),
                                const SizedBox(width: 32),
                                InkWell(
                                  onTap: () => _bloc.incrementCount(),
                                  borderRadius: BorderRadius.circular(20),
                                  child: Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: Colors.grey[100],
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(Icons.add, size: 20),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                Expanded(
                                  child: OutlineButton(
                                    onPress: () {
                                      context.router.push(const CountRoute());
                                    },
                                    title: "Go to Count Page",
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: PrimaryButton(
                                    onPress: () {
                                      context.router.push(const TemplateRoute());
                                    },
                                    title: "Go to Template",
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    ),
                  ),

                  // 3. Modals & Action Sheet Card
                  _buildSectionCard(
                    title: "Overlays & Dialog Modals",
                    subtitle: "Context extensions to trigger bottom sheets",
                    icon: Icons.layers,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: OutlineButton(
                                onPress: () => _showAlertDialog(context),
                                title: "Show Alert",
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: OutlineButton(
                                onPress: () => _showConfirm(context),
                                title: "Show Confirm",
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        SizedBox(
                          width: double.infinity,
                          child: PrimaryButton(
                            onPress: () => _showActionSheet(context),
                            title: "Open Action Bottom Sheet",
                          ),
                        ),
                      ],
                    ),
                  ),

                  // 4. Toast Notification & Loading Card
                  _buildSectionCard(
                    title: "Global Toasts & Loading State",
                    subtitle: "Common user feedback and operation blockers",
                    icon: Icons.notifications_active,
                    child: Column(
                      children: [
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          alignment: WrapAlignment.center,
                          children: [
                            _buildToastTriggerButton(
                              onPressed: () => GlobalUi.showInfo('This is an info toast'),
                              label: "Info",
                              color: Colors.blue,
                            ),
                            _buildToastTriggerButton(
                              onPressed: () => GlobalUi.showSuccess('Saved successfully'),
                              label: "Success",
                              color: Colors.green,
                            ),
                            _buildToastTriggerButton(
                              onPressed: () => GlobalUi.showWarning('Please check your input'),
                              label: "Warning",
                              color: Colors.orange,
                            ),
                            _buildToastTriggerButton(
                              onPressed: () => GlobalUi.showError('Something went wrong'),
                              label: "Error",
                              color: Colors.red,
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          width: double.infinity,
                          child: PrimaryButton(
                            onPress: () {
                              GlobalUi.showLoading();
                              Future.delayed(
                                const Duration(seconds: 2),
                                GlobalUi.hideLoading,
                              );
                            },
                            title: "Trigger Loading Overlay (2s)",
                          ),
                        ),
                      ],
                    ),
                  ),

                  // 5. Input Fields Card
                  _buildSectionCard(
                    title: "Form Inputs Showcase",
                    subtitle: "Pre-styled custom form fields and actions",
                    icon: Icons.edit_note,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Full Name Input",
                          style: ResTextStyles().medium16.copyWith(fontSize: 14),
                        ),
                        const SizedBox(height: 8),
                        TextFormFieldCustom(
                          hintText: "Enter name",
                          iconSuffixIcon: Icon(
                            Icons.check_circle_outline,
                            color: ResColors().primary,
                            size: 20,
                          ),
                          onActionSuffixIcon: () {
                            getIt<LoggerHelper>().info("Suffix action tapped");
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
