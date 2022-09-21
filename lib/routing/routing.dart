import 'package:auto_route/annotations.dart';
import 'package:auto_route/empty_router_widgets.dart';
import 'package:graket_academy_master/app_pages/app_main_page.dart';
import 'package:graket_academy_master/app_pages/home_pages/favorites_page.dart';
import 'package:graket_academy_master/app_pages/home_pages/home.dart';
import 'package:graket_academy_master/app_pages/home_pages/my_courses_page.dart';
import 'package:graket_academy_master/app_pages/home_pages/notifications_page.dart';
import 'package:graket_academy_master/app_pages/home_pages/settings_page.dart';
import 'package:graket_academy_master/app_pages/starting_page.dart';
import 'package:graket_academy_master/pages/email_signup_page.dart';
import 'package:graket_academy_master/pages/onboard_page.dart';
import 'package:graket_academy_master/pages/signin_page.dart';
import 'package:graket_academy_master/pages/splash_page.dart';

@MaterialAutoRouter(replaceInRouteName: 'Page,Route', routes: <AutoRoute>[
  AutoRoute(page: AppStartingPage, initial: true),
  AutoRoute(page: OnboardPage),
  AutoRoute(page: SignInPage),
  AutoRoute(page: EmailSignUpPage),
  AutoRoute(page: SplashPage),
  AutoRoute(path: '/', page: AppMainPage, children: [
    AutoRoute(
        path: 'home',
        name: 'HomeRoute',
        page: EmptyRouterPage,
        children: [
          AutoRoute(path: '', page: Home, initial: true),
        ]),
    AutoRoute(
        path: 'favorites_page',
        name: 'FavoritesPageRoute',
        page: EmptyRouterPage,
        children: [
          AutoRoute(path: '', page: FavoritesPage, initial: true),
        ]),
    AutoRoute(
        path: 'my_courses_page',
        name: 'MyCoursesPageRoute',
        page: EmptyRouterPage,
        children: [
          AutoRoute(path: '', page: MyCoursesPage, initial: true),
        ]),
    AutoRoute(
        path: 'notifications_page',
        name: 'NotificationsPageRoute',
        page: EmptyRouterPage,
        children: [
          AutoRoute(path: '', page: NotificationsPage, initial: true),
        ]),
    AutoRoute(
        path: 'settings_page',
        name: 'SettingsPageRoute',
        page: EmptyRouterPage,
        children: [
          AutoRoute(path: '', page: SettingsPage, initial: true),
        ]),
  ]),
])
class $AppRouter {}
