// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:auto_route/auto_route.dart' as _i9;
import 'package:collection/collection.dart' as _i11;
import 'package:flutter/material.dart' as _i10;
import 'package:my_app/core/shared/dp_popup.dart' as _i3;
import 'package:my_app/pages/auth/login/login_page.dart' as _i5;
import 'package:my_app/pages/main/bottom_bar/bottom_bar_page.dart' as _i1;
import 'package:my_app/pages/main/count/count_page.dart' as _i2;
import 'package:my_app/pages/main/home/home_page.dart' as _i4;
import 'package:my_app/pages/onboarding/onboarding_page.dart' as _i6;
import 'package:my_app/pages/splash/splash_page.dart' as _i7;
import 'package:my_app/pages/template/template_page.dart' as _i8;

/// generated route for
/// [_i1.BottomBarPage]
class BottomBarRoute extends _i9.PageRouteInfo<void> {
  const BottomBarRoute({List<_i9.PageRouteInfo>? children})
    : super(BottomBarRoute.name, initialChildren: children);

  static const String name = 'BottomBarRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return _i9.WrappedRoute(child: const _i1.BottomBarPage());
    },
  );
}

/// generated route for
/// [_i2.CountPage]
class CountRoute extends _i9.PageRouteInfo<void> {
  const CountRoute({List<_i9.PageRouteInfo>? children})
    : super(CountRoute.name, initialChildren: children);

  static const String name = 'CountRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return _i9.WrappedRoute(child: const _i2.CountPage());
    },
  );
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

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<DPPopupArgs>();
      return _i3.DPPopup(
        key: args.key,
        title: args.title,
        subTitle: args.subTitle,
        actions: args.actions,
        isActiveIconClose: args.isActiveIconClose,
      );
    },
  );
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

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! DPPopupArgs) return false;
    return key == other.key &&
        title == other.title &&
        subTitle == other.subTitle &&
        const _i11.ListEquality<_i10.Widget>().equals(actions, other.actions) &&
        isActiveIconClose == other.isActiveIconClose;
  }

  @override
  int get hashCode =>
      key.hashCode ^
      title.hashCode ^
      subTitle.hashCode ^
      const _i11.ListEquality<_i10.Widget>().hash(actions) ^
      isActiveIconClose.hashCode;
}

/// generated route for
/// [_i4.HomePage]
class HomeRoute extends _i9.PageRouteInfo<void> {
  const HomeRoute({List<_i9.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return _i9.WrappedRoute(child: const _i4.HomePage());
    },
  );
}

/// generated route for
/// [_i5.LoginPage]
class LoginRoute extends _i9.PageRouteInfo<void> {
  const LoginRoute({List<_i9.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return _i9.WrappedRoute(child: const _i5.LoginPage());
    },
  );
}

/// generated route for
/// [_i6.OnBoardingPage]
class OnBoardingRoute extends _i9.PageRouteInfo<void> {
  const OnBoardingRoute({List<_i9.PageRouteInfo>? children})
    : super(OnBoardingRoute.name, initialChildren: children);

  static const String name = 'OnBoardingRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i6.OnBoardingPage();
    },
  );
}

/// generated route for
/// [_i7.SplashPage]
class SplashRoute extends _i9.PageRouteInfo<void> {
  const SplashRoute({List<_i9.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i7.SplashPage();
    },
  );
}

/// generated route for
/// [_i8.TemplatePage]
class TemplateRoute extends _i9.PageRouteInfo<void> {
  const TemplateRoute({List<_i9.PageRouteInfo>? children})
    : super(TemplateRoute.name, initialChildren: children);

  static const String name = 'TemplateRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i8.TemplatePage();
    },
  );
}
