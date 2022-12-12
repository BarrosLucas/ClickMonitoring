import 'package:embarcados/models/login/LoginModel.dart';
import 'package:embarcados/request/ApiConstants.dart';
import 'package:http/http.dart' as http;

class LoginRequest{

  Future<bool> doLogin(LoginModel loginModel) async {
    final response = await http.post(
      Uri.parse(ApiConstants.login),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: loginModel.toJson(),
    );
    if(response.statusCode == 202){
      return true;
    }
    return false;
  }

}