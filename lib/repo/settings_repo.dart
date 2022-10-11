import 'dart:convert';
import 'package:pocketwatch_mobile/network_module/api_path.dart';
import 'package:pocketwatch_mobile/network_module/http_client.dart';
import 'package:pocketwatch_mobile/utils/customDialog.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsRepo {
  Future<dynamic> handleContactInfo(
      BuildContext context, name, bname, phone, email, tick) async {
    CustomDialog cD = CustomDialog();
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var user = jsonDecode(localStorage.getString('user'));
    // String gen = types[selectedType];
    var data = {
      'user_id': user['id'],
      'name': name,
      'buyer_name': bname,
      'email': email,
      'mobile': phone,
      'showSellerDetails': tick
    };
    final res = await HttpClient.instance
        .fetchParamData(APIPathHelper.getValue(APIPath.add_ContactInfo), data);

    print(res.body);
    if (res.statusCode == 200) {
      cD.successFlushbar(
        context,
        "Updation Complete ",
      );
    } else {
      cD.failedFlushbar(
        context,
        "Check all input fields",
      );
    }
  }

  change(BuildContext context, old, newP, confirm) async {
    CustomDialog cD = CustomDialog();
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var user = jsonDecode(localStorage.getString('user'));
    var data = {
      'user_id': user['id'],
      'oldPassword': old,
      'password': newP,
      'password_confirmation': confirm,
    };
    final res = await HttpClient.instance
        .fetchParamData(APIPathHelper.getValue(APIPath.changePassword), data);
    if (res.body == '0') {
      cD.successFlushbar(context, "Password Successfully Changed");
    } else {
      cD.failedFlushbar(context, "Password Change Unsuccessful");
    }
  }

  loadUserData() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var user = jsonDecode(localStorage.getString('user'));
    var data = {
      'id': user['id'],
    };
    final res = await HttpClient.instance
        .fetchParamData(APIPathHelper.getValue(APIPath.get_User), data);
    // print(res.body["name"]);
    if (res.statusCode == 200 && res.body != "") {
      var responseJson = json.decode(res.body);
      return responseJson;
    }
  }
}
