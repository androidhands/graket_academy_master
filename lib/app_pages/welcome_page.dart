import 'package:flutter/material.dart';
import 'package:graket_academy_master/app_pages/home_pages/home.dart';

import 'dart:async';

import 'package:graket_academy_master/components/colors.dart';
import 'package:graket_academy_master/pages/signin_page.dart';


class WelcomePage extends StatefulWidget {
  WelcomePage(this.isLoggedIn, {Key? key}) : super(key: key);
  String isLoggedIn;
  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 5),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => widget.isLoggedIn=='true' ? Home(index: 0) : const SignInPage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Text("Welcome to",
                    style: TextStyle(
                        fontSize: 27,
                        fontWeight: FontWeight.bold,
                        color: neutral5Color)),
                const Text("GrakeT Academy",
                    style: TextStyle(
                        fontSize: 27,
                        fontWeight: FontWeight.bold,
                        color: neutral5Color)),
                const SizedBox(height: 40),
                Image.asset('assets/images/onboard1.png'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
