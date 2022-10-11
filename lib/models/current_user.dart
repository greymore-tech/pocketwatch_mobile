import 'package:shared_preferences/shared_preferences.dart';

class CurrentUser {
  Future<String> onStartup() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    String retVal = "error";
    try {
      var user = localStorage.getString('email');
      if (user != null) {
        retVal = "success";
      }
    } catch (e) {
      print(e);
    }
    return retVal;
  }
}
