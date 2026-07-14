import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/core/localization/app_localization.dart';
import 'package:my_app/core/resources/res.dart';
import 'package:my_app/core/shared/lazy_load_indexed_stack.dart';
import 'package:my_app/pages/main/bottom_bar/bloc/bottom_bar_bloc.dart';
import 'package:my_app/pages/main/bottom_bar/bloc/bottom_bar_event.dart';
import 'package:my_app/pages/main/bottom_bar/bloc/bottom_bar_state.dart';
import 'package:my_app/pages/main/favorite/favorite_view_model.dart';
import 'package:my_app/pages/main/home/home_page.dart';
import 'package:my_app/pages/main/favorite/favorite_page.dart';
import 'package:my_app/pages/main/notifications/notification_page.dart';
import 'package:my_app/pages/main/notifications/notification_view_model.dart';
import 'package:my_app/pages/main/settings/settings_page.dart';
import 'package:my_app/generated/di/di.dart';
import 'package:my_app/pages/main/settings/settings_view_model.dart';
import 'package:my_app/pages/main/home/bloc/home_bloc.dart';

@RoutePage()
class BottomBarPage extends StatelessWidget implements AutoRouteWrapper {
  const BottomBarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomBarBloc, BottomBarState>(
      builder: (context, state) {
        return Scaffold(
          body: LazyLoadIndexedStack(
            index: state.currentIndex,
            children: [
              BlocProvider(
                create: (context) => HomeBloc(),
                child: const HomePage(),
              ),
              FavoritePage(
                viewModel: FavoriteViewModel(),
              ),
              NotificationPage(
                viewModel: NotificationViewModel(),
              ),
              SettingsPage(
                viewModel: SettingsViewModel(),
              ),
            ],
          ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: ResColors().white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.06),
                  blurRadius: 16,
                  offset: const Offset(0, -4),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: BottomNavigationBar(
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(
                      state.currentIndex == 0 ? Icons.home : Icons.home_outlined,
                      size: 24,
                    ),
                    label: AppLocalization.of(context).home,
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      state.currentIndex == 1 ? Icons.favorite : Icons.favorite_outline,
                      size: 24,
                    ),
                    label: AppLocalization.of(context).favorites,
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      state.currentIndex == 2 ? Icons.notifications : Icons.notifications_outlined,
                      size: 24,
                    ),
                    label: AppLocalization.of(context).notifications,
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      state.currentIndex == 3 ? Icons.settings : Icons.settings_outlined,
                      size: 24,
                    ),
                    label: AppLocalization.of(context).settings,
                  ),
                ],
                type: BottomNavigationBarType.fixed,
                elevation: 0,
                backgroundColor: Colors.transparent,
                selectedFontSize: 11,
                unselectedFontSize: 11,
                currentIndex: state.currentIndex,
                selectedItemColor: ResColors().primary,
                unselectedItemColor: Colors.grey[400],
                selectedLabelStyle: ResTextStyles().medium16.copyWith(
                      fontSize: 11,
                      color: ResColors().primary,
                      height: 1.6,
                    ),
                unselectedLabelStyle: ResTextStyles().regular14.copyWith(
                      fontSize: 11,
                      color: Colors.grey[400],
                      height: 1.6,
                    ),
                onTap: (index) {
                  context.read<BottomBarBloc>().add(BottomBarIndexChanged(index));
                },
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<BottomBarBloc>(),
      child: this,
    );
  }
}
