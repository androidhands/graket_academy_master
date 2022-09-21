import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:graket_academy_master/app_pages/home_pages/home.dart';
import 'package:graket_academy_master/authentication.dart';
import 'package:graket_academy_master/components/colors.dart';
import 'package:graket_academy_master/core/alert_dialog.dart';
import 'package:graket_academy_master/pages/email_signup_page.dart';
import 'package:graket_academy_master/pages/phone_signup_page.dart';
import 'package:graket_academy_master/routing/routing.gr.dart';

import 'package:shared_preferences/shared_preferences.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool _isSecure = true;
  bool _isEmailError = false;
  bool _isPassError = false;
  bool isProcessing = false;
  String _emailError = '';
  String _passError = '';

  final emailController = TextEditingController();
  final passController = TextEditingController();
  final confirmPassController = TextEditingController();

  bool isEmail(String em) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(p);
    return regExp.hasMatch(em);
  }

  bool isPassword(String value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  setLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('isLoggedIn', 'true');
  }

  setFirstOpen() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('isFirstOpen', 'true');
  }

  @override
  void dispose() {
    passController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    setFirstOpen();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(top: 50),
                  child: Text(
                    "Welcome to\nGrakeT Academy",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: neutral1Color),
                  ),
                ),
                const SizedBox(height: 50),
                const Padding(
                  padding: EdgeInsets.only(left: 20, bottom: 10),
                  child: Text("Email",
                      style: TextStyle(fontSize: 15, color: neutral2Color)),
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  decoration: InputDecoration(
                    filled: true,
                    contentPadding: const EdgeInsets.all(15),
                    fillColor: neutral4Color,
                    errorText: _isEmailError ? _emailError : null,
                    hintText: 'Your email',
                    hintStyle: const TextStyle(color: neutral3Color),
                    enabledBorder: const UnderlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: neutral4Color),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: neutral4Color),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20, bottom: 10, top: 20),
                  child: Text("Password",
                      style: TextStyle(fontSize: 15, color: neutral2Color)),
                ),
                TextFormField(
                  obscureText: _isSecure,
                  keyboardType: TextInputType.visiblePassword,
                  controller: passController,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                        padding: const EdgeInsets.all(0),
                        color: noneColor,
                        highlightColor: noneColor,
                        hoverColor: noneColor,
                        focusColor: noneColor,
                        splashColor: noneColor,
                        disabledColor: noneColor,
                        onPressed: () {
                          setState(() {
                            _isSecure = !_isSecure;
                          });
                        },
                        icon: _isSecure
                            ? const ImageIcon(
                                AssetImage('assets/icons/hide_pass.png'),
                                color: neutral3Color)
                            : const ImageIcon(
                                AssetImage('assets/icons/show_pass.png'),
                                color: neutral3Color)),
                    filled: true,
                    contentPadding: const EdgeInsets.all(15),
                    fillColor: neutral4Color,
                    errorText: _isPassError ? _passError : null,
                    hintText: 'Your password',
                    hintStyle: const TextStyle(color: neutral3Color),
                    enabledBorder: const UnderlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: neutral4Color),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: neutral4Color),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      splashColor: noneColor,
                      focusColor: noneColor,
                      hoverColor: noneColor,
                      highlightColor: noneColor,
                      onTap: () {
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
                      },
                      child: const Text("Forgot your password?",
                          style: TextStyle(fontSize: 15, color: primaryColor)),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                Center(
                  child: !isProcessing
                      ? ElevatedButton.icon(
                          icon: const Icon(Icons.login),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {
                            FocusScope.of(context).unfocus();
                            if (emailController.text.isNotEmpty &&
                                isEmail(emailController.text)) {
                              setState(() {
                                _isEmailError = false;
                              });
                              if (passController.text.isNotEmpty &&
                                  isPassword(passController.text)) {
                                setState(() {
                                  _isPassError = false;
                                  isProcessing = true;
                                });
                                EmailAuthentication()
                                    .emailSignIn(
                                        email: emailController.text,
                                        password: passController.text)
                                    .then((value) {
                                  if (value == null) {
                                    setLoggedIn();
                                    setState(() {
                                      isProcessing = false;
                                    });
                                    context.router.replace(const AppMainRoute());
                                   /*  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Home(index: 0)),
                                    ); */
                                  } else {
                                    // Fail SignIn
                                    setState(() {
                                      isProcessing = false;
                                    });
                                    ShowAlertDialog().showErrorDialog(
                                        context, 'Login Error', value);
                                  }
                                });
                              } else {
                                setState(() {
                                  _isPassError = true;
                                  _passError = 'Password is not correct';
                                });
                                ShowAlertDialog().showErrorDialog(
                                    context,
                                    'Invalid Password',
                                    'Please Type Valid Password');
                              }
                            } else {
                              setState(() {
                                _isEmailError = true;
                                _emailError = 'Invalid Email';
                              });
                              ShowAlertDialog().showErrorDialog(context,
                                  'Invalid Email', 'Please Type Valid Email');
                            }
                          },
                          label: Container(
                            alignment: Alignment.center,
                            width: size.width - 40,
                            height: 45,
                            child: const Text("Sign in",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15)),
                          ),
                        )
                      : const CircularProgressIndicator(),
                ),
                const SizedBox(height: 20),
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
                              builder: (context) => const PhoneSignUpPage()));
                    },
                    child: const Text(
                      "SignIn with Phone Number",
                      style: TextStyle(
                          fontSize: 14,
                          color: primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: const <Widget>[
                    Expanded(
                        child: Divider(thickness: 1, color: neutral3Color)),
                    Expanded(
                      child: Center(
                        child: Text(
                          'Or sign in with',
                          style: TextStyle(color: neutral3Color),
                        ),
                      ),
                    ),
                    Expanded(
                        child: Divider(thickness: 1, color: neutral3Color)),
                  ],
                ),
                const SizedBox(height: 30),
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: neutral4Color,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image.asset('assets/images/faceid.png'),
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Don’t have account?',
                      style: TextStyle(color: neutral3Color, fontSize: 15),
                    ),
                    InkWell(
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
                      child: const Text(" Sign up",
                          style: TextStyle(fontSize: 15, color: primaryColor)),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
