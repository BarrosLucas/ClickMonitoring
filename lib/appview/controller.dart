import 'package:mobx/mobx.dart';
part 'controller.g.dart';

class Controller = ControllerBase with _$Controller;

abstract class ControllerBase with Store{
  @observable
  int page = 2;

  @observable
  bool newDeliveryPageVisible = false;

  @action
  setPage(int p){
    page = p;
  }

  @action
  setPageVisibleNewDelivery(bool newValue){
    newDeliveryPageVisible = newValue;
  }
}