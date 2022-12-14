import 'package:embarcados/models/measure/MeasureModel.dart';
import 'package:embarcados/models/order/OrderModel.dart';
import 'package:embarcados/request/measures/MeasureRequest.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
part 'controller.g.dart';

class Controller = ControllerBase with _$Controller;

abstract class ControllerBase with Store {
  @observable
  var times = ObservableList<String>();

  @observable
  var health = ObservableList<String>();

  @observable
  var temperature = ObservableList<String>();
  
  @observable
  ObservableList<MeasureModel> measures = ObservableList();

  @action
  Future<bool> loadDataHistory(OrderModel order) async{
    measures = ObservableList.of(await (MeasureRequest()).getMeasuresByOrder(order.id));

    for(var i in measures){
      times.add(DateFormat("dd/MM/yyyy hh:mm:ss").format(i.created));
      health.add(i.temperature < 0? "SAUDÁVEL" : "NÃO SAUDÁVEL");
      temperature.add(i.temperature.toString());
    }
    return true;
  }
}