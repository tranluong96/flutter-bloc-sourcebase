// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:flutter/material.dart' as _i10;
import 'package:my_app/core/shared/dp_popup.dart' as _i3;
import 'package:my_app/pages/auth/login/login_page.dart' as _i5;
import 'package:my_app/pages/main/bottom_bar/bottom_bar_page.dart' as _i1;
import 'package:my_app/pages/main/count/count_page.dart' as _i2;
import 'package:my_app/pages/main/home/home_page.dart' as _i4;
import 'package:my_app/pages/onboarding/onboarding_page.dart' as _i6;
import 'package:my_app/pages/splash/splash_page.dart' as _i7;
import 'package:my_app/pages/template/template_page.dart' as _i8;

abstract class $AppRouter extends _i9.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    BottomBarRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.WrappedRoute(child: const _i1.BottomBarPage()),
      );
    },
    CountRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.WrappedRoute(child: const _i2.CountPage()),
      );
    },
    DPPopup.name: (routeData) {
      final args = routeData.argsAs<DPPopupArgs>();
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.DPPopup(
          key: args.key,
          title: args.title,
          subTitle: args.subTitle,
          actions: args.actions,
          isActiveIconClose: args.isActiveIconClose,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.WrappedRoute(child: const _i4.HomePage()),
      );
    },
    LoginRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.LoginPage(),
      );
    },
    OnBoardingRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.OnBoardingPage(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.SplashPage(),
      );
    },
    TemplateRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.TemplatePage(),
      );
    },
  };
}

/// generated route for
/// [_i1.BottomBarPage]
class BottomBarRoute extends _i9.PageRouteInfo<void> {
  const BottomBarRoute({List<_i9.PageRouteInfo>? children})
      : super(
          BottomBarRoute.name,
          initialChildren: children,
        );

  static const String name = 'BottomBarRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i2.CountPage]
class CountRoute extends _i9.PageRouteInfo<void> {
  const CountRoute({List<_i9.PageRouteInfo>? children})
      : super(
          CountRoute.name,
          initialChildren: children,
        );

  static const String name = 'CountRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i3.DPPopup]
class DPPopup extends _i9.PageRouteInfo<DPPopupArgs> {
  DPPopup({
    _i10.Key? key,
    String title = '',
    required String subTitle,
    List<_i10.Widget> actions = const [],
    bool isActiveIconClose = false,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          DPPopup.name,
          args: DPPopupArgs(
            key: key,
            title: title,
            subTitle: subTitle,
            actions: actions,
            isActiveIconClose: isActiveIconClose,
          ),
          initialChildren: children,
        );

  static const String name = 'DPPopup';

  static const _i9.PageInfo<DPPopupArgs> page = _i9.PageInfo<DPPopupArgs>(name);
}

class DPPopupArgs {
  const DPPopupArgs({
    this.key,
    this.title = '',
    required this.subTitle,
    this.actions = const [],
    this.isActiveIconClose = false,
  });

  final _i10.Key? key;

  final String title;

  final String subTitle;

  final List<_i10.Widget> actions;

  final bool isActiveIconClose;

  @override
  String toString() {
    return 'DPPopupArgs{key: $key, title: $title, subTitle: $subTitle, actions: $actions, isActiveIconClose: $isActiveIconClose}';
  }
}

/// generated route for
/// [_i4.HomePage]
class HomeRoute extends _i9.PageRouteInfo<void> {
  const HomeRoute({List<_i9.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i5.LoginPage]
class LoginRoute extends _i9.PageRouteInfo<void> {
  const LoginRoute({List<_i9.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i6.OnBoardingPage]
class OnBoardingRoute extends _i9.PageRouteInfo<void> {
  const OnBoardingRoute({List<_i9.PageRouteInfo>? children})
      : super(
          OnBoardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnBoardingRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i7.SplashPage]
class SplashRoute extends _i9.PageRouteInfo<void> {
  const SplashRoute({List<_i9.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i8.TemplatePage]
class TemplateRoute extends _i9.PageRouteInfo<void> {
  const TemplateRoute({List<_i9.PageRouteInfo>? children})
      : super(
          TemplateRoute.name,
          initialChildren: children,
        );

  static const String name = 'TemplateRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}
