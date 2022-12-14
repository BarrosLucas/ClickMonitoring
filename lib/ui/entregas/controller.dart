import 'package:embarcados/models/order/OrderModel.dart';
import 'package:embarcados/request/orders/OrderRequest.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
part 'controller.g.dart';

class Controller = ControllerBase with _$Controller;

abstract class ControllerBase with Store {
  @observable
  var startsList = ObservableList<String>();
  
  @observable
  var finishesList = ObservableList<String>();

  @observable
  var stopsList = ObservableList<int>();
  
  @action 
  loadData()async{
    startsList.clear();
    finishesList.clear();
    stopsList.clear();
    List<OrderModel> orders = await (OrderRequest().fetchOrders());
    for(var i in orders){
      DateTime tempDateStart = DateTime.parse(i.datetime_start);
      DateTime tempDateFinish = DateTime.parse(i.datetime_end);


      startsList.add(DateFormat("dd/MM/yyyy hh:mm:ss").format(tempDateStart));

      if(i.datetime_end.isNotEmpty){
        finishesList.add(DateFormat("dd/MM/yyyy hh:mm:ss").format(tempDateFinish));
      }else{
        finishesList.add("EM TRÂNSITO");
      }
    }
  }
}