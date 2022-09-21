import 'package:flutter/cupertino.dart';
import 'package:graket_academy_master/app_pages/welcome_page.dart';
import 'package:graket_academy_master/authentication.dart';
import 'package:graket_academy_master/core/firebase.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../pages/splash_page.dart';

class AppStartingPage extends StatelessWidget {
  String isFirstOpen = "";
  String isLoggedIn = "";
  initShared() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    isFirstOpen = sharedPreferences.getString('isFirstOpen') ?? 'false';
    isLoggedIn = sharedPreferences.getString('isLoggedIn') ?? 'false';
  }

  Database database = Database();
  @override
  Widget build(BuildContext context) {
    initShared();
    if (EmailAuthentication().user?.uid != null) {
      isLoggedIn = 'true';
      isFirstOpen = 'true';
      // print(EmailAuthentication().user.uid);
    } else {
      isLoggedIn = 'false';
    }
    return isFirstOpen != 'true' ? const SplashPage() : WelcomePage(isLoggedIn);
  }
}
