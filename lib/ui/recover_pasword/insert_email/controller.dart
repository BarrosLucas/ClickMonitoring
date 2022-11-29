import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
part 'controller.g.dart';

class Controller = ControllerBase with _$Controller;

abstract class ControllerBase with Store{
  @observable
  TextEditingController emailController = TextEditingController();

  @observable
  bool validEmail = false;

  @observable
  String text = "";

  @action
  validate(){
    validEmail = false;
    print("${emailController.text}");
    if(emailController.text.endsWith(".com")){
      if(emailController.text.contains("@")){
        text = emailController.text;
        validEmail = true;
      }
    }
  }
}