import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:graket_academy_master/app_pages/welcome_page.dart';
import 'package:graket_academy_master/authentication.dart';
import 'package:graket_academy_master/core/firebase.dart';
import 'package:graket_academy_master/pages/splash_page.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
  ]);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SharedPreferences prefs = await SharedPreferences.getInstance();
  // await prefs.setString('isLoggedIn', 'false');
  // await prefs.setString('isFirstOpen', 'false');
  // await prefs.setString('type', 'none');
  // await prefs.setString('uid', 'none');
  String isFirstOpen = prefs.getString('isFirstOpen') ?? 'false';
  String isLoggedIn = prefs.getString('isLoggedIn') ?? 'false';

  if (EmailAuthentication().user?.uid != null) {
    isLoggedIn = 'true';
    isFirstOpen = 'true';
    // print(EmailAuthentication().user.uid);
  } else {
    isLoggedIn = 'false';
  }
  Database database = Database();
  

  runApp(
    MyApp(isFirstOpen, isLoggedIn),
  );
}

class MyApp extends StatelessWidget {
  MyApp(this.isFirstOpen, this.isLoggedIn, {Key? key}) : super(key: key);
  String isFirstOpen;
  String isLoggedIn;
  @override
  Widget build(BuildContext context) {
    FocusScope.of(context).unfocus();
    return MaterialApp(
      title: 'GrakeT Academy',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'ElMessiri',
      ),
      home: 
          isFirstOpen != 'true' ? const SplashPage() : WelcomePage(isLoggedIn),
    );
  }
}
