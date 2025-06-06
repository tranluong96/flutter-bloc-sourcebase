import 'package:auto_route/auto_route.dart';
import 'package:awesome_extensions/awesome_extensions_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/core/localization/app_localization.dart';
import 'package:my_app/core/services/fcm_push_notification/fcm_push_notification.dart';
import 'package:my_app/core/utils/extensions/string_extensions.dart';
import 'package:my_app/generated/assets.gen.dart';
import 'package:my_app/generated/di/di.dart';
import 'package:my_app/pages/auth/login/bloc/login_bloc.dart';
import 'package:my_app/pages/auth/login/bloc/login_event.dart';
import 'package:my_app/pages/auth/login/bloc/login_state.dart';
import 'package:my_app/pages/base/base_page_mixin.dart';
import 'package:my_app/pages/widgets/required_box/required_box.dart';
import 'package:my_app/pages/widgets/text_form_field/text_form_field_custom.dart';
import 'package:my_app/routes/router.gr.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with BasePageMixin {
  LoginBloc get _bloc => context.read<LoginBloc>();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    _bloc.successStream.listen((success) {
      if (success) {
        context.router.replace(const BottomBarRoute());
        getIt<FCMPushNotification>().generatorToken();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  String? get title => AppLocalization.of(context).loginTitle;

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
        return SafeArea(
          child: Scaffold(
            body: Form(
              key: _bloc.formKey,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                    16.heightBox,
                    RequiredField(
                      title: AppLocalization.of(context).password,
                      isRequired: true,
                      child: TextFormFieldCustom(
                        controller: _passwordController,
                        keyboardType: TextInputType.text,
                        focusNode: _passwordFocusNode,
                        hintText: AppLocalization.of(context).password,
                        isObscureText: state.isObscure,
                        iconSuffixIcon: _returnIconEye(state.isObscure),
                        onActionSuffixIcon: () {
                          _bloc.add(LoginEyeChanged(!state.isObscure));
                        },
                        onChange: (value) {
                          _bloc.add(LoginPasswordChanged(value));
                        },
                        errorText: state.passwordError,
                      ),
                    ),
                    32.heightBox,
                    ElevatedButton(
                      onPressed: () {
                        if (state.email.content.isEmpty) {
                          FocusScope.of(context).requestFocus(_emailFocusNode);
                          return;
                        } else if (state.password.content.isEmpty) {
                          FocusScope.of(context)
                              .requestFocus(_passwordFocusNode);
                          return;
                        } else {
                          _bloc.add(const LoginValidationSubmit());
                        }
                      },
                      child: Text(AppLocalization.of(context).loginSignIn),
                    ),
                  ],
                ).paddingSymmetric(horizontal: 16),
              ),
            ),
          ),
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
