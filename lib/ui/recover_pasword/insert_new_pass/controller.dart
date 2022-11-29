import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
part 'controller.g.dart';

class Controller = ControllerBase with _$Controller;

abstract class ControllerBase with Store{
  @observable
  bool successChangedPass = false;


  @observable
  bool requestsOK = false;

  @observable
  bool passEquals = false;

  @observable
  TextEditingController newP = TextEditingController();

  @observable
  TextEditingController confirmNewP = TextEditingController();

  @action
  isPassEquals(){
    passEquals = false;
    if(newP.text == confirmNewP.text){
      passEquals = true;
    }
  }


  @action
  validate(){
    String newPass = newP.text;
    requestsOK = false;
      if(newPass.length >= 8){
          if(newPass.contains("0") ||
              newPass.contains("1") ||
              newPass.contains("2") ||
              newPass.contains("3") ||
              newPass.contains("4") ||
              newPass.contains("5") ||
              newPass.contains("6") ||
              newPass.contains("7") ||
              newPass.contains("8") ||
              newPass.contains("9")){
            if(newPass.toUpperCase() != newPass){
              if(newPass.contains("!") ||
                  newPass.contains("@") ||
                  newPass.contains("#") ||
                  newPass.contains("\$") ||
                  newPass.contains("%") ||
                  newPass.contains("&") ||
                  newPass.contains("*") ||
                  newPass.contains("(") ||
                  newPass.contains(")") ||
                  newPass.contains("-") ||
                  newPass.contains("+") ||
                  newPass.contains("=") ||
                  newPass.contains("/") ||
                  newPass.contains("[") ||
                  newPass.contains("]") ||
                  newPass.contains("{") ||
                  newPass.contains("}") ||
                  newPass.contains("^") ||
                  newPass.contains("~") ||
                  newPass.contains(";") ||
                  newPass.contains(".") ||
                  newPass.contains(";") ||
                  newPass.contains("´") ||
                  newPass.contains("`") ||
                  newPass.contains("\"")
              ){
                requestsOK = true;
              }
            }
          }
        }

    }

  @action
  setPassword(){
    String newPass = newP.text;

    validate();

    if(requestsOK){
      successChangedPass = true;
      confirmNewP.text = "";
      newP.text = "";
    }
  }

  @action
  setSuccessEnable(bool value){
    successChangedPass = value;
  }
}