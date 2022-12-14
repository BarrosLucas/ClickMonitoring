import 'package:embarcados/models/measure/MeasureModel.dart';
import 'package:embarcados/models/order/OrderModel.dart';
import 'package:embarcados/request/measures/MeasureRequest.dart';
import 'package:embarcados/request/orders/OrderRequest.dart';
import 'package:google_maps/google_maps.dart' as gMap;
import 'package:mobx/mobx.dart';
part 'controller.g.dart';

class Controller = ControllerBase with _$Controller;

abstract class ControllerBase with Store{
  @observable
  bool visible = false;

  @observable
  String description = "";

  @observable
  double speed = 0.0;

  @observable
  double temperature = 0.0;

  @observable
  double humidity = 0.0;

  @observable
  String status = "Ativo";
  
  @observable
  gMap.LatLng currentCoordinates = gMap.LatLng(-7.160975673332396, -34.817297882735765);

  @observable
  MeasureModel ?lastMeasure;

  @action
  updateInfo(OrderModel order) async{
    try {
      lastMeasure = await (MeasureRequest().getLastMeasureOpenOrder());
      currentCoordinates = gMap.LatLng(double.parse(lastMeasure!.latitude), double.parse(lastMeasure!.longitude));
    } catch (e) {
      print(e.toString());
    }
  }

  @action
  endInfo(OrderModel orderModel){
    (OrderRequest().endOrder(orderModel));
  }

  @action
  setDescription(String description){
    this.description = description;
  }

  @action
  setSpeed(double speed){
    this.speed = speed;
  }

  @action
  setTemperature(double temperature){
    this.temperature = temperature;
  }

  @action
  setHumidity(double humidity){
    this.humidity = humidity;
  }

  @action
  setStatus(String status){
    this.status = status;
  }

  @action
  setVisible(bool visible, String description, double speed, double temperature,
      double humidity, String status){
    setDescription(description);
    setSpeed(speed);
    setTemperature(temperature);
    setHumidity(humidity);
    setStatus(status);
    this.visible = visible;
  }
}