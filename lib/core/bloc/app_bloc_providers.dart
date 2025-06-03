import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/pages/auth/login/bloc/login_bloc.dart';
import 'package:my_app/pages/auth/login/bloc/login_event.dart' as auth;
import 'package:my_app/pages/main/count/bloc/count_bloc.dart';
import 'package:my_app/pages/main/home/bloc/home_bloc.dart';
import 'package:my_app/pages/template/bloc/template_bloc.dart';
import 'package:my_app/pages/template/bloc/template_event.dart' as template;

class AppBlocProviders extends StatelessWidget {
  final Widget child;

  const AppBlocProviders({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeBloc()),
        BlocProvider(create: (context) => CountBloc()),
        BlocProvider<LoginBloc>(
            create: (_) => LoginBloc()..add(auth.AppStarted())),
        BlocProvider<TemplateBloc>(
            create: (_) => TemplateBloc()..add(template.TemplateStarted())),
      ],
      child: child,
    );
  }
}
