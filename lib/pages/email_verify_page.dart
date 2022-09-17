import 'dart:async';
import 'package:flutter/material.dart';
import 'package:graket_academy_master/authentication.dart';
import 'package:graket_academy_master/components/colors.dart';
import 'package:graket_academy_master/core/firebase.dart';
import 'package:graket_academy_master/pages/email_signup_page.dart';
import 'package:graket_academy_master/pages/info_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EmailVerifyPage extends StatefulWidget {
  const EmailVerifyPage({Key? key}) : super(key: key);

  @override
  State<EmailVerifyPage> createState() => _EmailVerifyPageState();
}

class _EmailVerifyPageState extends State<EmailVerifyPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Timer? timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 3), (_) => verify());
  }

  editData(uid) {
    Database database = Database();
    database.setData('users/$uid', {'verify': true});
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  verify() {
    if (EmailAuthentication().isVerified()!) {
      timer?.cancel();
      editData(EmailAuthentication().user.uid);
      addPref();
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const InfoPage()));
    }
  }

  addPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('state', 'notInfo');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 100),
              const Center(
                  child: Text(
                "Verify",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: neutral1Color),
              )),
              const SizedBox(height: 50),
              const Center(
                  child: Text(
                'A verification email has been sent to your email.\nTry check spam inbox',
                style: TextStyle(color: neutral2Color, fontSize: 15),
                textAlign: TextAlign.center,
              )),
              const SizedBox(height: 50),
              Center(
                child: InkWell(
                  splashColor: noneColor,
                  focusColor: noneColor,
                  hoverColor: noneColor,
                  highlightColor: noneColor,
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const EmailSignUpPage()));
                  },
                  child: const Text("Edit your Email",
                      style: TextStyle(fontSize: 16, color: primaryColor)),
                ),
              ),
              const SizedBox(height: 30),
              const Center(
                  child: Text('I didn’t receive a code!',
                      style: TextStyle(color: neutral1Color, fontSize: 13))),
              Center(
                child: InkWell(
                  splashColor: noneColor,
                  focusColor: noneColor,
                  hoverColor: noneColor,
                  highlightColor: noneColor,
                  onTap: () {
                    EmailAuthentication().userVerify();
                  },
                  child: const Text("Re-send",
                      style: TextStyle(fontSize: 13, color: primaryColor)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
