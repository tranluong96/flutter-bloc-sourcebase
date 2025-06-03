import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:my_app/core/resources/res.dart';
import 'package:my_app/core/utils/session/session.dart';
import 'package:my_app/generated/di/di.dart';
import 'package:my_app/routes/router.gr.dart';

@RoutePage()
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    final hasLogin = getIt<Session>().hasLogin;

    Future.delayed(const Duration(milliseconds: 2000)).then((value) {
      if (hasLogin) {
        context.router.replace(const BottomBarRoute());
      } else {
        context.router.replace(const LoginRoute());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'My App',
          style: ResTextStyles().medium16.copyWith(
                color: ResColors().primary,
              ),
        ),
      ),
      backgroundColor: ResColors().white,
    );
  }
}
