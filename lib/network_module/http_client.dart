import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:pocketwatch_mobile/network_module/api_base.dart';
import 'package:pocketwatch_mobile/network_module/api_exceptions.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class HttpClient {
  static final HttpClient _singleton = HttpClient();

  static HttpClient get instance => _singleton;

  var token;
  var header;
  _getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    token = jsonDecode(localStorage.getString('token'))['token'];
  }

  Future<dynamic> fetchData(String url, {Map<String, String> params}) async {
    var responseJson;
    String uRL = "/api/" + url;
    // var uri = APIBase.baseURL +
    //     url +
    //     ((params != null) ? this.queryParameters(params) : "");
    try {
      await _getToken();
      final response = await http.get(Uri.https(APIBase.baseURL, uRL),
          headers: _setHeaders());
      // print(response.body.toString());
      responseJson = _returnResponse(response);
    } on SocketException {
      // throw FetchDataException('No Internet connection');
      Fluttertoast.showToast(
          gravity: ToastGravity.TOP,
          msg: "No Internet Connection",
          backgroundColor: Colors.red[900]);
    }
    return responseJson;
  }

  Future<dynamic> fetchTerms(
    String url,
  ) async {
    var responseJson;

    // var uri = APIBase.termsURL + url;
    try {
      // await _getToken();
      final response = await http.get(Uri.https(APIBase.termsURL, url));
      // print(response.body.toString());
      responseJson = _returnResponse(response);
    } on SocketException {
      // throw FetchDataException('No Internet connection');
      Fluttertoast.showToast(
          gravity: ToastGravity.TOP,
          msg: "No Internet Connection",
          backgroundColor: Colors.red[900]);
    }
    return responseJson;
  }

  String queryParameters(Map<String, String> params) {
    if (params != null) {
      final jsonString = Uri(queryParameters: params).query;
      return jsonString;
    }
    return '';
  }

  Future<http.Response> fetchParamData(String url, dynamic body,
      {Map<String, String> params}) async {
    var responseJson;
    String uRL = "/api/" + url;
    try {
      await _getToken();
      final response = await http.post(Uri.https(APIBase.baseURL, uRL, params),
          body: jsonEncode(body), headers: _setHeaders());
      responseJson = _returnResponse(response);
    } on SocketException {
      // throw FetchDataException('No Internet connection');
      Fluttertoast.showToast(
          gravity: ToastGravity.TOP,
          msg: "No Internet Connection",
          backgroundColor: Colors.red[900]);
    }
    return responseJson;
  }

  Future<http.Response> postData(String url, dynamic body) async {
    var responseJson;
    String uRL = "/api/" + url;
    try {
      final response = await http.post(Uri.https(APIBase.baseURL, uRL),
          body: jsonEncode(body), headers: _setHeaders());
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = response;
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        // throw UnauthorisedException(response.body.toString());
        var responseJson = response;
        return responseJson;
      case 500:
      default:
        print(
            "Error occured while Communication with Server with StatusCode : ${response.statusCode}");
        var responseJson = response;
        return responseJson;
      // throw FetchDataException(
      //     'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
