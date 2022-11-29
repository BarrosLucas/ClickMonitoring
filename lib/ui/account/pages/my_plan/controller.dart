import 'package:mobx/mobx.dart';
part 'controller.g.dart';

class Controller = ControllerBase with _$Controller;

abstract class ControllerBase with Store{
  @observable
  String dateStart = "";

  @observable
  String dateFinish = "";

  @action
  load(){
    dateStart = "01/01/2020";
    dateFinish = "12/12/2022";
  }
}