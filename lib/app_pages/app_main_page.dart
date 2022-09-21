import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:graket_academy_master/routing/routing.gr.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class AppMainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        HomeRoute(),
        MyCoursesPageRoute(),
        FavoritesPageRoute(),
        NotificationsPageRoute(),
        SettingsPageRoute()
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return SalomonBottomBar(
          margin: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: [
            SalomonBottomBarItem(
              title: const Text('Home'),
              icon: const Icon(Icons.home_filled),
            ),
            SalomonBottomBarItem(
              title: const Text('My Courses'),
              icon: const Icon(Icons.play_circle),
            ),
            SalomonBottomBarItem(
              title: const Text('Favorites'),
              icon: const Icon(Icons.favorite),
            ),
            SalomonBottomBarItem(
              title: const Text('Notifications'),
              icon: const Icon(Icons.notifications),
            ),
            SalomonBottomBarItem(
              title: const Text('Settings'),
              icon: const Icon(Icons.settings),
            ),
          ],
        );
      },
    );
  }
}
