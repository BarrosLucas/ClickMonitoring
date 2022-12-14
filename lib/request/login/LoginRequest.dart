import 'dart:convert';

import 'package:embarcados/models/login/LoginModel.dart';
import 'package:embarcados/request/ApiConstants.dart';
import 'package:http/http.dart' as http;

class LoginRequest{

  Future<bool> doLogin(LoginModel loginModel) async {
    print("Request: ${jsonEncode(loginModel.toJson())}");

    final response = await http.post(
      Uri.parse(ApiConstants.login),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(loginModel.toJson()),
    );

    if(response.statusCode == 202){
      print("Login success");
      return true;
    }
    print("Login fail - Request error: ${response.statusCode}");
    return false;
  }

}