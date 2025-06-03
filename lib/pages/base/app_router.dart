import 'package:flutter/material.dart';

class ScreenRoute {
  ScreenRoute({required this.name, required this.builder});

  final String name;

  final WidgetBuilder builder;

  PageRoute material() => MaterialPageRoute(
        builder: builder,
        settings: RouteSettings(name: name, arguments: this),
      );

  PageRoute dialog({bool fullscreenDialog = false}) => MaterialPageRoute(
        fullscreenDialog: fullscreenDialog,
        builder: builder,
        settings: RouteSettings(name: name, arguments: this),
      );

  PageRoute fade() => FadePageRoute(
        screen: builder,
        name: name,
        arguments: this,
      );
}

class FadePageRoute<T> extends PageRoute<T> {
  FadePageRoute({
    required this.screen,
    required this.name,
    Object? arguments,
  }) : super(settings: RouteSettings(name: name, arguments: arguments));

  final WidgetBuilder screen;
  final String name;

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) =>
      FadeTransition(
        opacity: animation,
        child: screen(context),
      );

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => const Duration(microseconds: 300);

  @override
  Color? get barrierColor => Colors.transparent;

  @override
  String? get barrierLabel => '';
}
