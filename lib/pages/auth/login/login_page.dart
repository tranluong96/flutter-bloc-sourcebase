import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/core/localization/app_localization.dart';
import 'package:my_app/core/resources/res.dart';
import 'package:my_app/core/services/fcm_push_notification/fcm_push_notification.dart';
import 'package:my_app/core/utils/extensions/string_extensions.dart';
import 'package:my_app/generated/assets.gen.dart';
import 'package:my_app/generated/di/di.dart';
import 'package:my_app/pages/auth/login/bloc/login_bloc.dart';
import 'package:my_app/pages/auth/login/bloc/login_event.dart';
import 'package:my_app/pages/auth/login/bloc/login_state.dart';
import 'package:my_app/pages/base/base_page_mixin.dart';
import 'package:my_app/pages/widgets/buttons/primary_button.dart';
import 'package:my_app/pages/widgets/required_box/required_box.dart';
import 'package:my_app/pages/widgets/text_form_field/text_form_field_custom.dart';
import 'package:my_app/routes/router.gr.dart';

@RoutePage()
class LoginPage extends StatefulWidget implements AutoRouteWrapper {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginBloc()..add(AppStarted()),
      child: this,
    );
  }
}

class _LoginPageState extends State<LoginPage> with BasePageMixin {
  LoginBloc get _bloc => context.read<LoginBloc>();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  StreamSubscription<bool>? _successSub;

  @override
  void initState() {
    _successSub = _bloc.successStream.listen((success) {
      if (!mounted) return;
      if (success) {
        context.router.replace(const BottomBarRoute());
        getIt<FCMPushNotification>().generatorToken();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _successSub?.cancel();
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return null; // Full-screen premium background layout without standard appbar
  }

  @override
  bool get resizeToAvoidBottomInset => true;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      bloc: _bloc,
      listener: (context, state) {},
      builder: (context, state) => buildPage(context),
    );
  }

  @override
  Widget buildBody(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Stack(
          children: [
            // Main content body
            SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  child: Form(
                    key: _bloc.formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Titles
                        Text(
                          AppLocalization.of(context).loginTitle,
                          style: ResTextStyles().medium16.copyWith(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: ResColors().white,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Sign in to your Dipro account",
                          style: ResTextStyles().regular14.copyWith(
                            color: ResColors().white.withOpacity(0.85),
                          ),
                        ),
                        const SizedBox(height: 32),
                        // Login Card
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.95),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.15),
                                blurRadius: 20,
                                offset: const Offset(0, 10),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RequiredField(
                                title: AppLocalization.of(context).email,
                                isRequired: true,
                                child: TextFormFieldCustom(
                                  controller: _emailController,
                                  keyboardType: TextInputType.emailAddress,
                                  focusNode: _emailFocusNode,
                                  hintText: AppLocalization.of(context).email,
                                  onChange: (value) {
                                    _bloc.add(LoginEmailChanged(value));
                                  },
                                  errorText: state.emailError,
                                ),
                              ),
                              const SizedBox(height: 20),
                              RequiredField(
                                title: AppLocalization.of(context).password,
                                isRequired: true,
                                child: TextFormFieldCustom(
                                  controller: _passwordController,
                                  keyboardType: TextInputType.text,
                                  focusNode: _passwordFocusNode,
                                  hintText: AppLocalization.of(
                                    context,
                                  ).password,
                                  isObscureText: state.isObscure,
                                  iconSuffixIcon: _returnIconEye(
                                    state.isObscure,
                                  ),
                                  onActionSuffixIcon: () {
                                    _bloc.add(
                                      LoginEyeChanged(!state.isObscure),
                                    );
                                  },
                                  onChange: (value) {
                                    _bloc.add(LoginPasswordChanged(value));
                                  },
                                  errorText: state.passwordError,
                                ),
                              ),
                              const SizedBox(height: 12),
                              Align(
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                  onPressed: () {
                                    // Placeholder for future forgot password action
                                  },
                                  child: Text(
                                    "Forgot Password?",
                                    style: ResTextStyles().regular14.copyWith(
                                      color: ResColors().white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 24),
                              SizedBox(
                                width: double.infinity,
                                child: PrimaryButton(
                                  isLoading:
                                      state.status == LoginStatus.loading,
                                  onPress: () {
                                    if (state.email.content.isEmpty) {
                                      FocusScope.of(
                                        context,
                                      ).requestFocus(_emailFocusNode);
                                      return;
                                    } else if (state.password.content.isEmpty) {
                                      FocusScope.of(
                                        context,
                                      ).requestFocus(_passwordFocusNode);
                                      return;
                                    } else {
                                      _bloc.add(const LoginValidationSubmit());
                                    }
                                  },
                                  title: AppLocalization.of(
                                    context,
                                  ).loginSignIn,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 48),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  // return icon eye
  Widget _returnIconEye(bool isObscure) {
    return isObscure
        ? Assets.icons.icOpenEye.image(scale: 3)
        : Assets.icons.icCloseEye.image(scale: 3);
  }
}
