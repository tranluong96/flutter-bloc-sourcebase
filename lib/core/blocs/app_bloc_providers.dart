import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/pages/template/bloc/template_bloc.dart';
import 'package:my_app/pages/template/bloc/template_event.dart' as template;

/// Chỉ đặt ở đây những bloc THỰC SỰ cần phạm vi toàn app (dùng chung giữa
/// nhiều màn hình như một event bus). Các bloc gắn với 1 màn hình phải được
/// provide tại chính màn hình đó (qua `wrappedRoute`) để state tự được clear
/// khi màn hình bị dispose.
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
        BlocProvider<TemplateBloc>(
          create: (_) => TemplateBloc()..add(template.TemplateStarted()),
        ),
      ],
      child: child,
    );
  }
}
