import 'package:embarcados/models/businesses/BusinessModel.dart';
import 'package:embarcados/request/business/BusinessRequest.dart';
import 'package:mobx/mobx.dart';
part 'controller.g.dart';

class Controller = ControllerBase with _$Controller;

abstract class ControllerBase with Store{
  @observable
  BusinessModel ?account;

  @observable
  int page = 0;

  @action
  setPage(int p){
    page = p;
  }

  @action
  Future<bool> loadInfoAccount()async{
    print("OU");
    account = await (BusinessRequest().getBusinessUser());
    print("UAI");
    return true;
  }
}