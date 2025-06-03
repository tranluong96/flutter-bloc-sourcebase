/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsFontsGen {
  const $AssetsFontsGen();

  /// File path: assets/fonts/NotoSansJP-Black.ttf
  String get notoSansJPBlack => 'assets/fonts/NotoSansJP-Black.ttf';

  /// File path: assets/fonts/NotoSansJP-Bold.ttf
  String get notoSansJPBold => 'assets/fonts/NotoSansJP-Bold.ttf';

  /// File path: assets/fonts/NotoSansJP-Light.ttf
  String get notoSansJPLight => 'assets/fonts/NotoSansJP-Light.ttf';

  /// File path: assets/fonts/NotoSansJP-Medium.ttf
  String get notoSansJPMedium => 'assets/fonts/NotoSansJP-Medium.ttf';

  /// File path: assets/fonts/NotoSansJP-Regular.ttf
  String get notoSansJPRegular => 'assets/fonts/NotoSansJP-Regular.ttf';

  /// File path: assets/fonts/NotoSansJP-Thin.ttf
  String get notoSansJPThin => 'assets/fonts/NotoSansJP-Thin.ttf';

  /// List of all assets
  List<String> get values => [
        notoSansJPBlack,
        notoSansJPBold,
        notoSansJPLight,
        notoSansJPMedium,
        notoSansJPRegular,
        notoSansJPThin
      ];
}

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/ic_arrow_right.png
  AssetGenImage get icArrowRight =>
      const AssetGenImage('assets/icons/ic_arrow_right.png');

  /// File path: assets/icons/ic_building.png
  AssetGenImage get icBuilding =>
      const AssetGenImage('assets/icons/ic_building.png');

  /// File path: assets/icons/ic_close_eye.png
  AssetGenImage get icCloseEye =>
      const AssetGenImage('assets/icons/ic_close_eye.png');

  /// File path: assets/icons/ic_internet.png
  AssetGenImage get icInternet =>
      const AssetGenImage('assets/icons/ic_internet.png');

  /// File path: assets/icons/ic_logout.png
  AssetGenImage get icLogout =>
      const AssetGenImage('assets/icons/ic_logout.png');

  /// File path: assets/icons/ic_open_eye.png
  AssetGenImage get icOpenEye =>
      const AssetGenImage('assets/icons/ic_open_eye.png');

  /// File path: assets/icons/ic_policy.png
  AssetGenImage get icPolicy =>
      const AssetGenImage('assets/icons/ic_policy.png');

  /// File path: assets/icons/ic_quickscan.png
  AssetGenImage get icQuickscan =>
      const AssetGenImage('assets/icons/ic_quickscan.png');

  /// File path: assets/icons/ic_security.png
  AssetGenImage get icSecurity =>
      const AssetGenImage('assets/icons/ic_security.png');

  /// File path: assets/icons/ic_sequenrial.png
  AssetGenImage get icSequenrial =>
      const AssetGenImage('assets/icons/ic_sequenrial.png');

  /// File path: assets/icons/ic_user.png
  AssetGenImage get icUser => const AssetGenImage('assets/icons/ic_user.png');

  /// File path: assets/icons/ic_user_leave.png
  AssetGenImage get icUserLeave =>
      const AssetGenImage('assets/icons/ic_user_leave.png');

  /// File path: assets/icons/img_google.png
  AssetGenImage get imgGoogle =>
      const AssetGenImage('assets/icons/img_google.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        icArrowRight,
        icBuilding,
        icCloseEye,
        icInternet,
        icLogout,
        icOpenEye,
        icPolicy,
        icQuickscan,
        icSecurity,
        icSequenrial,
        icUser,
        icUserLeave,
        imgGoogle
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/img_banner_topbar.png
  AssetGenImage get imgBannerTopbar =>
      const AssetGenImage('assets/images/img_banner_topbar.png');

  /// File path: assets/images/img_bg_card_info.png
  AssetGenImage get imgBgCardInfo =>
      const AssetGenImage('assets/images/img_bg_card_info.png');

  /// File path: assets/images/img_bg_login.png
  AssetGenImage get imgBgLogin =>
      const AssetGenImage('assets/images/img_bg_login.png');

  /// File path: assets/images/img_bg_splash.png
  AssetGenImage get imgBgSplash =>
      const AssetGenImage('assets/images/img_bg_splash.png');

  /// File path: assets/images/img_logo.png
  AssetGenImage get imgLogo =>
      const AssetGenImage('assets/images/img_logo.png');

  /// File path: assets/images/img_logo_login.png
  AssetGenImage get imgLogoLogin =>
      const AssetGenImage('assets/images/img_logo_login.png');

  /// File path: assets/images/img_logo_main.png
  AssetGenImage get imgLogoMain =>
      const AssetGenImage('assets/images/img_logo_main.png');

  /// File path: assets/images/img_onboarding.png
  AssetGenImage get imgOnboarding =>
      const AssetGenImage('assets/images/img_onboarding.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        imgBannerTopbar,
        imgBgCardInfo,
        imgBgLogin,
        imgBgSplash,
        imgLogo,
        imgLogoLogin,
        imgLogoMain,
        imgOnboarding
      ];
}

class $AssetsLocalesGen {
  const $AssetsLocalesGen();

  /// File path: assets/locales/ja.json
  String get ja => 'assets/locales/ja.json';

  /// List of all assets
  List<String> get values => [ja];
}

class Assets {
  Assets._();

  static const String aEnv = '.env';
  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsLocalesGen locales = $AssetsLocalesGen();

  /// List of all assets
  static List<String> get values => [aEnv];
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
