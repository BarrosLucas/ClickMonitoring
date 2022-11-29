import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
part 'controller.g.dart';

class Controller = ControllerBase with _$Controller;

abstract class ControllerBase with Store{
  @observable
  bool successChangedPass = false;

  @observable
  String email = "";

  @observable
  bool enableButton = false;

  @observable
  String currentPassword = "";

  @observable
  TextEditingController currentP = TextEditingController();

  @observable
  TextEditingController newP = TextEditingController();

  @observable
  TextEditingController confirmNewP = TextEditingController();



  @action
  load(){
    email = "transilva@exemplo.com";
    currentPassword = "senha123";
  }

  @action
  validate(){
    String currentPass = currentP.text;
    String confirmCP = confirmNewP.text;
    String newPass = newP.text;
    enableButton = false;
    if(confirmCP == newPass){
      if(currentPassword == currentPass){
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
                enableButton = true;
              }
            }
          }
        }
      }
    }
  }

  @action
  setPassword(){
    String newPass = newP.text;

    validate();

    if(enableButton){
      currentPassword = newPass;
      successChangedPass = true;
      confirmNewP.text = "";
      currentP.text =  "";
      newP.text = "";
    }
  }

  @action
  setSuccessEnable(bool value){
    successChangedPass = value;
  }
}