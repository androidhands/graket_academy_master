import 'package:flutter/material.dart';
import 'package:graket_academy_master/authentication.dart';
import 'package:graket_academy_master/components/colors.dart';
import 'package:graket_academy_master/core/alert_dialog.dart';
import 'package:graket_academy_master/pages/signin_page.dart';

import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  setLoggedOut() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('isLoggedIn', 'false');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:   AppBar(
        backgroundColor: neutral5Color,
        centerTitle: true,
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu),
            color: neutral1Color),
        title: const Text(
          'Settings',
          style: TextStyle(
              fontSize: 20, color: neutral1Color, fontWeight: FontWeight.w500),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
              color: neutral1Color),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Account',
                  style: TextStyle(
                      fontSize: 20,
                      color: neutral1Color,
                      fontWeight: FontWeight.w600)),
              const SizedBox(height: 10),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  leading: const Padding(
                    padding: EdgeInsets.all(10),
                    child:
                        Icon(Icons.edit_calendar_outlined, color: neutral1Color),
                  ),
                  title: const Text('Change Password',
                      style: TextStyle(
                          fontSize: 15,
                          color: neutral1Color,
                          fontWeight: FontWeight.w400)),
                  subtitle: const Text('Change your current password',
                      style: TextStyle(fontSize: 13, color: neutral3Color)),
                  trailing:
                      const Icon(Icons.arrow_forward_ios, color: neutral1Color),
                  horizontalTitleGap: 10,
                  onTap: () {},
                ),
              ),
              const SizedBox(height: 5),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  leading: const Padding(
                    padding: EdgeInsets.all(10),
                    child: Icon(Icons.privacy_tip_outlined, color: neutral1Color),
                  ),
                  title: const Text('Privacy Policy',
                      style: TextStyle(
                          fontSize: 15,
                          color: neutral1Color,
                          fontWeight: FontWeight.w400)),
                  subtitle: const Text('Ours privacy policy',
                      style: TextStyle(fontSize: 13, color: neutral3Color)),
                  trailing:
                      const Icon(Icons.arrow_forward_ios, color: neutral1Color),
                  horizontalTitleGap: 10,
                  onTap: () {},
                ),
              ),
              const SizedBox(height: 20),
              const Text('Preferences',
                  style: TextStyle(
                      fontSize: 20,
                      color: neutral1Color,
                      fontWeight: FontWeight.w600)),
              const SizedBox(height: 10),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  leading: const Padding(
                    padding: EdgeInsets.all(10),
                    child: Icon(Icons.location_on_outlined, color: neutral1Color),
                  ),
                  title: const Text('Country',
                      style: TextStyle(
                          fontSize: 15,
                          color: neutral1Color,
                          fontWeight: FontWeight.w400)),
                  subtitle: const Text('Change your current country',
                      style: TextStyle(fontSize: 13, color: neutral3Color)),
                  trailing:
                      const Icon(Icons.arrow_forward_ios, color: neutral1Color),
                  horizontalTitleGap: 10,
                  onTap: () {},
                ),
              ),
              const SizedBox(height: 5),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  leading: const Padding(
                    padding: EdgeInsets.all(10),
                    child: Icon(Icons.language_outlined, color: neutral1Color),
                  ),
                  title: const Text('Language',
                      style: TextStyle(
                          fontSize: 15,
                          color: neutral1Color,
                          fontWeight: FontWeight.w400)),
                  subtitle: const Text('Change your primary language',
                      style: TextStyle(fontSize: 13, color: neutral3Color)),
                  trailing:
                      const Icon(Icons.arrow_forward_ios, color: neutral1Color),
                  horizontalTitleGap: 10,
                  onTap: () {},
                ),
              ),
              const SizedBox(height: 5),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  leading: const Padding(
                    padding: EdgeInsets.all(10),
                    child:
                        Icon(Icons.currency_yen_outlined, color: neutral1Color),
                  ),
                  title: const Text('Currency',
                      style: TextStyle(
                          fontSize: 15,
                          color: neutral1Color,
                          fontWeight: FontWeight.w400)),
                  subtitle: const Text('Change your primary currency',
                      style: TextStyle(fontSize: 13, color: neutral3Color)),
                  trailing:
                      const Icon(Icons.arrow_forward_ios, color: neutral1Color),
                  horizontalTitleGap: 10,
                  onTap: () {},
                ),
              ),
              const SizedBox(height: 5),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  leading: const Padding(
                    padding: EdgeInsets.all(10),
                    child: Icon(Icons.logout_outlined, color: semantic1Color),
                  ),
                  title: const Text('Log out',
                      style: TextStyle(
                          fontSize: 15,
                          color: semantic1Color,
                          fontWeight: FontWeight.w400)),
                  subtitle: const Text('Log out of your current account',
                      style: TextStyle(fontSize: 13, color: neutral3Color)),
                  trailing:
                      const Icon(Icons.arrow_forward_ios, color: neutral1Color),
                  horizontalTitleGap: 10,
                  onTap: () {
                    EmailAuthentication().signOut().then((value) {
                      if (value == null) {
                        setLoggedOut();
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignInPage()));
                      } else {
                        ShowAlertDialog()
                            .showErrorDialog(context, 'Logout Error', value);
                      }
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
