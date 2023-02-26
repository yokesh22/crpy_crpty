import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceFunctions {
  static String isuserLoggedInSharedPreference = "ISLOGGEDIN";
  static String userPhoneSharedPreference = "UserPhoneKey";

  static userLoggedIn(bool isLoggedIn) async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    var res = prefs.setBool(isuserLoggedInSharedPreference, isLoggedIn);
    return res;
  }

  static saveUserPhone(String userName) async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    var res = prefs.setString(userPhoneSharedPreference, userName);
    return res;
  }

  static getUserLoggedIn() async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    var res = prefs.getBool(isuserLoggedInSharedPreference);
    return res;
  }

  static getUser() async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    var res = prefs.getString(userPhoneSharedPreference);
    return res;
  }

  static signOut() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var res = sharedPreferences.remove(userPhoneSharedPreference);
    return res;
  }
}
