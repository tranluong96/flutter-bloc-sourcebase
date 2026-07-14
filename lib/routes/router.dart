import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';
import 'package:my_app/routes/router.gr.dart';

@AutoRouterConfig(replaceInRouteName: "Page,Route")
@lazySingleton
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType =>
      const RouteType.material(); //.cupertino, .adaptive ..etc

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: OnBoardingRoute.page),
        AutoRoute(page: BottomBarRoute.page),
        AutoRoute(page: CountRoute.page),
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: TemplateRoute.page),
      ];
}
