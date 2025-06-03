import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:my_app/core/localization/app_localization.dart';
import 'package:my_app/core/localization/language_provider.dart';
import 'package:my_app/core/resources/res.dart';
import 'package:my_app/core/utils/extensions/error_extensions.dart';
import 'package:my_app/core/utils/extensions/modal_extensions.dart';
import 'package:my_app/core/utils/helpers/logger_helper/logger_helper.dart';
import 'package:my_app/generated/di/di.dart';
import 'package:my_app/pages/base/base_page_mixin.dart';
import 'package:my_app/pages/main/home/bloc/home_bloc.dart';
import 'package:my_app/pages/main/home/bloc/home_state.dart';
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
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: this,
    );
  }
}

class _HomePageState extends State<HomePage> with BasePageMixin {
  HomeBloc get _bloc => context.read<HomeBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
        bloc: _bloc,
        listener: (context, state) {
          if (state.status == HomeStatus.error) {
            context
                .showError(Exception('test'))
                .whenComplete(() => _bloc.resetState());
          }
          if (state.status == HomeStatus.loading) {
            context.showAlertLoading();
          } else if (state.status == HomeStatus.loaded) {
            context.hideAlertLoading();
          }
        },
        builder: (context, state) => buildPage(context));
  }

  @override
  String? get title => AppLocalization.of(context).home;

  final List<String> _tabs = ['Popular', 'Discount', 'Exclusive'];

  @override
  void initState() {
    super.initState();
    _bloc.init();
    _bloc.initLanguage(
      context.read<LanguageProvider>().currentLocale.languageCode == 'en',
    );
    // _bloc.showModalStream.listen((value) {
    //   print('show modal');
    //   _showAlertDialog(context);
    // });
  }

  // show alert dialog
  void _showAlertDialog(BuildContext context) async {
    await context.showAlertDialog(
      message:
          'This is a alert dialogThis is a alert dialogThis is a alert dialog',
      title: 'Alert',
    );
  }

  // show confirm dialog
  void _showConfirm(BuildContext context) async {
    final result = await context.showConfirmDialog(
      message: 'Are you sure you want to proceed?',
      title: 'Confirm',
      confirmText: 'Yes',
      cancelText: 'No',
    );
    if (result) {
      // Handle confirm action
      getIt<LoggerHelper>().info('User confirmed');
    }
  }

  // show action sheet
  void _showActionSheet(BuildContext context) async {
    final result = await context.showActionBottomSheet<String>(
      title: 'Choose an option',
      items: [
        const ActionSheetItem(
          title: 'Option 1',
          value: 'option1',
          icon: Icons.star,
        ),
        const ActionSheetItem(
          title: 'Option 2',
          value: 'option2',
          icon: Icons.favorite,
        ),
        const ActionSheetItem(
          title: 'Delete',
          value: 'delete',
          icon: Icons.delete,
          isDestructive: true,
        ),
      ],
      cancelText: 'Cancel',
    );
    if (result != null) {
      // Handle selected action
      getIt<LoggerHelper>().info('Selected: $result');
    }
  }

  @override
  Widget buildBody(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[];
          },
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Container(
                color: ResColors().white,
                child: Column(
                  children: [
                    //switch change language
                    Text("Language: ${_bloc.state.isEnglish}"),
                    Text("URL BASE: ${dotenv.env['BASE_URL']}"),
                    SwitchButton(
                      value: _bloc.state.isEnglish,
                      onChanged: (value) {
                        _bloc.toggleLanguage(value, context);
                      },
                    ),
                    StreamBuilder<int>(
                      stream: _bloc.countChanged,
                      builder: (context, asyncSnapshot) {
                        return Column(
                          children: [
                            Text("Count: ${asyncSnapshot.data ?? 0}"),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  onPressed: () => _bloc.decrementCount(),
                                  child: const Text("-"),
                                ),
                                const SizedBox(width: 16),
                                ElevatedButton(
                                  onPressed: () => _bloc.incrementCount(),
                                  child: const Text("+"),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: () {
                                context.router.push(const CountRoute());
                              },
                              child: const Text("Go to Count Page"),
                            ),
                          ],
                        );
                      },
                    ),
                    // Text form field
                    TextFormFieldCustom(
                      hintText: "Enter your name",
                      onActionSuffixIcon: () {
                        getIt<LoggerHelper>().info("test");
                      },
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context.router.push(const TemplateRoute());
                      },
                      child: const Text("Go to Template Page"),
                    ),
                    // show alert dialog
                    ElevatedButton(
                      onPressed: () {
                        _showAlertDialog(context);
                      },
                      child: const Text("Show Alert Dialog"),
                    ),
                    // show confirm dialog
                    ElevatedButton(
                      onPressed: () {
                        _showConfirm(context);
                      },
                      child: const Text("Show Confirm Dialog"),
                    ),
                    // show action sheet
                    ElevatedButton(
                      onPressed: () {
                        _showActionSheet(context);
                      },
                      child: const Text("Show Action Sheet"),
                    ),

                    // Show Error
                    ElevatedButton(
                      onPressed: () {
                        context.showError(Exception(
                            'test SDV ASD VDA VADFV DF    adfv dfv dfv daf vdf v dafv df vfd v vd fb dfbd fbdf bfsd bfg b '));
                      },
                      child: const Text("Show Error"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
