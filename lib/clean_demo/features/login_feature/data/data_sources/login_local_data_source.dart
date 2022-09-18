import 'package:shared_preferences/shared_preferences.dart';

abstract class LoginLocalDataSource {
  Future<void> setLoggedIn();
  Future<void> setFirstOpen();
}

class LoginLocalDataSourceImpl implements LoginLocalDataSource {
  @override
  Future<void> setFirstOpen() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('isLoggedIn', 'true');
  }

  @override
  Future<void> setLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('isFirstOpen', 'true');
  }
}
