import 'package:mobx/mobx.dart';
part 'controller.g.dart';

class Controller = ControllerBase with _$Controller;

abstract class ControllerBase with Store{
  @observable
  String contactNumber = "";

  @action
  load(){
    contactNumber = "(83) 9 9999-9999";
  }
}