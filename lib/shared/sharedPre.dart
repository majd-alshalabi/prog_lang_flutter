import 'package:shared_preferences/shared_preferences.dart';

class SharedPre {
  static final String userId = 'user';

  static final String emailID = 'email';

  static final String tokenId = 'token';

  static Future<void> setUsername(String val) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(userId, val);
  }

  static Future<String> getUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userId) ?? '';
  }

  static Future<void> setEmail(String val) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(emailID, val);
  }

  static Future<String> getEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(emailID) ?? '';
  }

  static Future<void> setToken(String val) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(tokenId, val);
  }

  static Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(tokenId) ?? '';
  }
}
