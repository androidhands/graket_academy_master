import 'package:flutter/material.dart';
import 'package:graket_academy_master/components/colors.dart';
import 'package:graket_academy_master/pages/email_signup_page.dart';
import 'package:graket_academy_master/pages/phone_verify_page.dart';
import 'package:graket_academy_master/pages/signin_page.dart';


class PhoneSignUpPage extends StatefulWidget {
  const PhoneSignUpPage({Key? key}) : super(key: key);

  @override
  State<PhoneSignUpPage> createState() => _PhoneSignUpPageState();
}

class _PhoneSignUpPageState extends State<PhoneSignUpPage> {
  bool _isChecked = false;
  bool _isPhoneError = false;

  bool _isCheckError = false;
  String _phoneError = '';
  Color signupColor = neutral3Color;

  final phoneController = TextEditingController();

  // DatabaseReference ref = FirebaseDatabase.instance.ref("/");
  // late DataSnapshot snapshot;
  // late DataSnapshot snapshotInfo;
  // late Map<String, dynamic> usersInfo;
  // List usersEmails = [];
  // List usersNums = [];
  // List usersIDs = [];

  bool isValidPhoneNumber(String em) {
    String p = r'^(?:[+0][1-9])?[0-9]{10,12}$';
    RegExp regExp = RegExp(p);
    return regExp.hasMatch(em);
  }

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    // readData();
  }

  // readData() async {
  //   ref = FirebaseDatabase.instance.ref();
  //   snapshot = await ref.get();
  //   snapshotInfo = snapshot.child('users');
  //   usersInfo = Map<String, dynamic>.from(snapshotInfo.value as Map);
  //   usersNums = usersInfo.keys.toList();
  //   for (int i = 0; i < usersNums.length; i++) {
  //     usersEmails.add(snapshotInfo
  //         .child(usersNums[i] + '/email/')
  //         .value);
  //   }
  // }

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
                  child: Text("Phone Number",
                      style: TextStyle(fontSize: 15, color: neutral2Color)),
                ),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  controller: phoneController,
                  decoration: InputDecoration(
                    filled: true,
                    contentPadding: const EdgeInsets.all(15),
                    fillColor: neutral4Color,
                    hintText: 'Your phone number with country code',
                    errorText: _isPhoneError ? _phoneError : null,
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
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Checkbox(
                      value: _isChecked,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3)),
                      checkColor: neutral5Color,
                      activeColor: primaryColor,
                      fillColor: _isCheckError
                          ? MaterialStateProperty.resolveWith<Color>((states) {
                              return errorColor;
                            })
                          : null,
                      onChanged: (value) {
                        setState(() {
                          FocusScope.of(context).unfocus();
                          _isChecked = value!;
                          signupColor =
                              _isChecked ? primaryColor : neutral3Color;
                          _isCheckError = false;
                        });
                      },
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('By signing up you agree to our',
                            style:
                                TextStyle(color: neutral2Color, fontSize: 15)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            InkWell(
                              splashColor: noneColor,
                              focusColor: noneColor,
                              hoverColor: noneColor,
                              highlightColor: noneColor,
                              onTap: () {
                                FocusScope.of(context).unfocus();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const PhoneSignUpPage()));
                              },
                              child: const Text("terms of service ",
                                  style: TextStyle(
                                      fontSize: 15, color: primaryColor)),
                            ),
                            const Text('and ',
                                style: TextStyle(
                                    color: neutral2Color, fontSize: 15)),
                            InkWell(
                              splashColor: noneColor,
                              focusColor: noneColor,
                              hoverColor: noneColor,
                              highlightColor: noneColor,
                              onTap: () {
                                FocusScope.of(context).unfocus();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const PhoneSignUpPage()));
                              },
                              child: const Text("privacy policy",
                                  style: TextStyle(
                                      fontSize: 15, color: primaryColor)),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: MediaQuery.of(context).viewInsets.bottom != 0
          ? const SizedBox()
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          primary: signupColor),
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        if (phoneController.text.isNotEmpty &&
                            isValidPhoneNumber(phoneController.text)) {
                          setState(() {
                            _isPhoneError = false;
                          });
                          if (_isChecked) {
                            setState(() {
                              _isCheckError = false;
                            });
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PhoneVerifyPage(
                                        phoneNumber: phoneController.text)));
                          } else {
                            setState(() {
                              _isCheckError = true;
                            });
                          }
                        } else {
                          // print('Invalid Phone number');
                          setState(() {
                            _isPhoneError = true;
                            _phoneError = 'Invalid Phone number';
                          });
                        }
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: size.width - 40,
                        height: 45,
                        child: const Text("Sign In",
                            style:
                                TextStyle(color: Colors.white, fontSize: 15)),
                      )),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        splashColor: noneColor,
                        focusColor: noneColor,
                        hoverColor: noneColor,
                        highlightColor: noneColor,
                        onTap: () {
                          FocusScope.of(context).unfocus();
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const EmailSignUpPage()));
                        },
                        child: const Text("Sign up with Email",
                            style:
                                TextStyle(fontSize: 15, color: primaryColor)),
                      ),
                      const Text(' or  ',
                          style: TextStyle(color: neutral2Color, fontSize: 15)),
                      InkWell(
                        splashColor: noneColor,
                        focusColor: noneColor,
                        hoverColor: noneColor,
                        highlightColor: noneColor,
                        onTap: () {
                          FocusScope.of(context).unfocus();
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignInPage()));
                        },
                        child: const Text("Login",
                            style:
                                TextStyle(fontSize: 15, color: primaryColor)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
