import 'package:embarcados/models/businesses/BusinessModel.dart';
import 'package:embarcados/models/measure/MeasureModel.dart';
import 'package:embarcados/models/order/OrderModel.dart';
import 'package:embarcados/request/business/BusinessRequest.dart';
import 'package:embarcados/request/measures/MeasureRequest.dart';
import 'package:embarcados/request/orders/OrderRequest.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'controller.g.dart';

class Controller = ControllerBase with _$Controller;

abstract class ControllerBase with Store{
  @observable
  int page = 2;

  @observable
  BusinessModel ?user;

  @observable
  List<MeasureModel> ?measures = [];

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

  @observable
  TextEditingController origin = TextEditingController();

  @observable
  TextEditingController destiny = TextEditingController();

  @action
  setVisibilityDialog(bool visibility){
    visibleDialog = visibility;
  }

  @action
  newOrder() async{
    await (BusinessRequest().getBusinessUser()).then((value) {
      OrderModel orderModel = OrderModel(0, "", "", "", "", "", "", 1, "De ${origin.text} para ${destiny.text}", value.id,false);
      (OrderRequest().newOrder(orderModel));
    });
  }

  @action
  verifyOrder() async{
    try{
      order = await(OrderRequest().openOrder());
      if(order == null){
        page = 2;
      }else{
        if(page == 2){
          page = 7;
        }
      }
    }catch(e){
      print(e.toString());
    }
  }

  @action
  loadInfo() async{
    loadingInfo = true;
    try{
      print("TENTANDO CAPTURAR");
      order = await (OrderRequest().openOrder());
      print("Order capturada: \n$order");
      if(order != null){
        lastMeasure = await (MeasureRequest().getLastMeasureOpenOrder());
        measures = await (MeasureRequest().getMeasuresByOrder(order!.id));

        if(lastMeasure!=null){
          print("Ultima medicao: \n${lastMeasure!.toJson()}");
          print("Medicoes: ");
          if(measures != null){
            for(var i in measures!){
              print("${i.toJson()}");
            }
          }
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