import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:graket_academy_master/app_pages/welcome_page.dart';
import 'package:graket_academy_master/authentication.dart';
import 'package:graket_academy_master/core/firebase.dart';
import 'package:graket_academy_master/pages/splash_page.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';
import 'routing/routing.gr.dart';

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
 
  

  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
 
 
  final _appRouter = AppRouter();

  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    FocusScope.of(context).unfocus();
    return GetMaterialApp.router(

      title: 'GrakeT Academy',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'ElMessiri',
      ),
        routerDelegate: AutoRouterDelegate(_appRouter),

      // or
      // routerDelegate:_appDelegate.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
     
    );
  }
}
