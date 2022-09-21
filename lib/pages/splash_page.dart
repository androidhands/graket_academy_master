import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:graket_academy_master/components/colors.dart';
import 'dart:async';

import 'package:graket_academy_master/routing/routing.gr.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5),
        () => context.router.replace(const OnboardRoute())
        /*  Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const OnboardPage())) */
        );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Text(
          "GrakeT Academy",
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}
