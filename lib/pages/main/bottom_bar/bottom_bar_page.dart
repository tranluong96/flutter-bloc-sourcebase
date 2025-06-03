import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/core/localization/app_localization.dart';
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
          bottomNavigationBar: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: const Icon(Icons.home),
                label: AppLocalization.of(context).home,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.favorite),
                label: AppLocalization.of(context).favorites,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.notifications),
                label: AppLocalization.of(context).notifications,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.settings),
                label: AppLocalization.of(context).settings,
              ),
            ],
            type: BottomNavigationBarType.fixed,
            selectedFontSize: 12,
            currentIndex: state.currentIndex,
            selectedItemColor: Colors.amber[800],
            onTap: (index) {
              context.read<BottomBarBloc>().add(BottomBarIndexChanged(index));
            },
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
