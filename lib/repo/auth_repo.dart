import 'dart:convert';
import 'package:pocketwatch_mobile/models/user_model.dart';
import 'package:pocketwatch_mobile/network_module/api_path.dart';
import 'package:pocketwatch_mobile/network_module/http_client.dart';
import 'package:pocketwatch_mobile/route/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo {
  Future<dynamic> logout(context) async {
    final res = await HttpClient.instance
        .fetchData(APIPathHelper.getValue(APIPath.logout));
    // print(res.body);
    if (res.statusCode == 200) {
      print("Logout");
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.remove('user');
      localStorage.remove('mobile');
      localStorage.remove('token');
      // localStorage.remove('flag');
      // localStorage.remove('introDone');
      // localStorage.remove('displayShow');
      // Navigator.of(context)
      //     .pushNamedAndRemoveUntil(loginRoute, (Route<dynamic> route) => false);
    }
  }

  Future<dynamic> signup(name, email, password, confirm, mobile) async {
    var data = {
      'name': name,
      'email': email,
      'password': password,
      'password_confirmation': confirm,
      'mobile': int.parse(mobile),
      'buyer_name': name,
    };

    final res = await HttpClient.instance
        .postData(APIPathHelper.getValue(APIPath.signup), data);

    // print(res);
    var body = json.decode(res.body);
    if (res.statusCode == 200) {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('user', json.encode(body['user']));
      localStorage.setString('mobile', body['user']['mobile'].toString());
      localStorage.setString('token', json.encode(body['token']));
      return true;
    } else {
      var body = json.decode(res.body);
      return body;
    }
  }

  Future<dynamic> login(var name, var pass) async {
    var data = {
      "mobile": name,
      "password": pass,
    };
    final response = await HttpClient.instance
        .postData(APIPathHelper.getValue(APIPath.login), data);
    // print("Response - ${response['user']}");
    // print(response.statusCode);
    if (response.statusCode == 200) {
      var body = json.decode(response.body);
      User.fromJson(body['user']);
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('mobile', body['user']['mobile'].toString());
      localStorage.setString('token', json.encode(body['token']));
      localStorage.setString('user', json.encode(body['user']));
      // Navigator.of(context).pushReplacementNamed(authRoute);
      return true;
    } else {
      var body = json.decode(response.body);
      return body;
    }
  }
}
