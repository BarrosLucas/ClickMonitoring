import 'package:mobx/mobx.dart';
part 'controller.g.dart';

class Controller = ControllerBase with _$Controller;

abstract class ControllerBase with Store{
  @observable
  String cnpj = "";

  @observable
  String socialReason = "";

  @observable
  String headOffice = "";

  @action
  load(){
    cnpj = "101010100-0110";
    socialReason = "Transportar";
    headOffice = "Rua 1, ao lado da Rua 2";
  }
}