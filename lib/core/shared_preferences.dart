import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  init() {
    setLoggedIn(false);
    setFirstOpen(false);
    // print(getFirstOpen());
    // print(getLoggedIn());
  }

  setLoggedIn(bool isLoggedIn) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('isLoggedIn', '$isLoggedIn');
  }

  Future<String> getLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final action = prefs.getString('isLoggedIn') ?? 'false';
    return action;
  }

  setFirstOpen(bool isLoggedIn) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('isFirstOpen', '$isLoggedIn');
  }

  Future<String> getFirstOpen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final action = prefs.getString('isFirstOpen') ?? 'false';
    return action;
  }
}
