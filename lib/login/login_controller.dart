import 'package:embarcados/models/login/LoginModel.dart';
import 'package:embarcados/request/login/LoginRequest.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
part 'login_controller.g.dart';

class LoginController = ControllerBase with _$LoginController;

abstract class ControllerBase with Store{
  @observable
  bool loading = false;

  @observable
  bool success = false;

  @observable
  TextEditingController userInputController = TextEditingController();

  @observable
  TextEditingController passInputController = TextEditingController();

  @action
  doLogin() async {
    LoginModel user = LoginModel(userInputController.text, passInputController.text);
    loading = true;
    success = await LoginRequest().doLogin(user);
    loading = false;
  }
}