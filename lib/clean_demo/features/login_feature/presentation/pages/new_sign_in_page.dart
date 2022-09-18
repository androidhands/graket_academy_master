import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:graket_academy_master/clean_demo/features/login_feature/presentation/view_model/sign_in_view_model.dart';

import '../../../../../components/colors.dart';

class NewSignInPage extends GetWidget<SignInViewModel> {
  const NewSignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () {},
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
              
            ],
          ),
        )),
      ),
    );
  }
}
