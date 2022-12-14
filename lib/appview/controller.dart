import 'package:embarcados/models/businesses/BusinessModel.dart';
import 'package:embarcados/models/measure/MeasureModel.dart';
import 'package:embarcados/models/order/OrderModel.dart';
import 'package:embarcados/request/measures/MeasureRequest.dart';
import 'package:embarcados/request/orders/OrderRequest.dart';
import 'package:mobx/mobx.dart';
part 'controller.g.dart';

class Controller = ControllerBase with _$Controller;

abstract class ControllerBase with Store{
  @observable
  int page = 2;

  @observable
  BusinessModel ?user;

  @observable
  List<MeasureModel> measures = [];

  @observable
  OrderModel ?order;

  @observable
  MeasureModel ?lastMeasure;

  @observable
  bool newDeliveryPageVisible = false;

  @observable
  bool loadingInfo = false;

  @observable
  bool visibleDialog = false;

  @action
  setVisibilityDialog(bool visibility){
    visibleDialog = visibility;
  }

  @action
  verifyOrder() async{
    try{
      order = await(OrderRequest().openOrder());
      if(order == null){
        page = 2;
      }
    }catch(e){
      print(e.toString());
    }
  }

  @action
  loadInfo() async{
    loadingInfo = true;
    try{
      order = await (OrderRequest().openOrder());
      if(order != null){
        lastMeasure = await (MeasureRequest().getLastMeasureOpenOrder());
        measures = await (MeasureRequest().getMeasuresByOrder(order!.id));

        print("Ultima medicao: \n${lastMeasure!.toJson()}");
        print("Medicoes: ");
        for(var i in measures){
          print("${i.toJson()}");
        }

        page = 7;
      }else{
        print("Sem pedidos em aberto");
        page = 2;
      }
    }catch(e){
      print(e.toString());
    }
    loadingInfo = false;
  }

  @action
  setPage(int p){
    page = p;
  }

  @action
  setPageVisibleNewDelivery(bool newValue){
    newDeliveryPageVisible = newValue;
  }
}