import 'package:mobx/mobx.dart';
part 'controller.g.dart';

class Controller = ControllerBase with _$Controller;

abstract class ControllerBase with Store{
  @observable
  int page = 0;

  @action
  setPage(int p){
    page = p;
  }
}