import 'package:mobx/mobx.dart';
part 'controller.g.dart';

class Controller = ControllerBase with _$Controller;

abstract class ControllerBase with Store{
  @observable
  int page = 0;

  @observable
  bool enableButton = true;

  @observable
  String buttonContent = "RECUPERAR";

  @action
  setEnableButton(bool value){
    enableButton = value;
  }

  @action
  setPage(int p){
    page = p;
    if(page == 2){
      buttonContent = "REDEFINIR";
    }else{
      buttonContent = "RECUPERAR";
    }
  }
}