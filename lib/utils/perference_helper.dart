import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'contants.dart';

class PreferenceHelper {
  static const FlutterSecureStorage storage = FlutterSecureStorage();

  static setPreferenceValue(String keyPair, dynamic value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (value is bool) {
      await prefs.setBool(Constants.mpin, value);
    }
    if (value is int) {
      await prefs.setInt(Constants.mpin, value);
    }
    if (value is double) {
      await prefs.setDouble(Constants.mpin, value);
    }
    if (value is String) {
      await prefs.setString(Constants.mpin, value);
    }
  }

  static setLoginStatus(bool? isLogin) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (isLogin is bool) {
      await prefs.setBool(SharedPrefKeys.isLogin, isLogin);
    }
  }

  static Future<bool> getLoginStatus() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(SharedPrefKeys.isLogin) ?? false;
  }

}

clearPreference() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.clear();
}
