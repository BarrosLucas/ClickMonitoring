import 'package:embarcados/models/measure/MeasureModel.dart';
import 'package:embarcados/models/order/OrderModel.dart';
import 'package:embarcados/request/measures/MeasureRequest.dart';
import 'package:mobx/mobx.dart';
import 'package:google_maps/google_maps.dart' as gMap;
part 'controller.g.dart';

class Controller = ControllerBase with _$Controller;

abstract class ControllerBase with Store{
  @observable
  ObservableList<gMap.LatLng> coordinates = ObservableList();

  @observable
  ObservableList<gMap.LatLng> stops = ObservableList();

  @observable
  gMap.LatLng center = gMap.LatLng(0, 0);

  @observable
  String description = "";

  @observable
  String duration = "";

  @observable
  double temperature = 0.0;

  @observable
  String driver = "";

  @observable
  String status = "Ativo";

  @observable
  ObservableList<MeasureModel> measures = ObservableList();

  int firstMeasure(List<MeasureModel> measures){
    int index = 0;
    for(var i = 0; i < measures.length; i++){
      if(measures.elementAt(i).created.compareTo(measures.elementAt(index).created) < 0){
        index = 0;
      }
    }
    return index;
  }

  @action
  Future<bool> loadRoute(OrderModel order) async{
    double temp = 0.0;
    List<MeasureModel> meas = ObservableList.of(await MeasureRequest().getMeasuresByOrder(order.id));
    measures = ObservableList();
    while(meas.isNotEmpty){
      measures!.add(meas.elementAt(firstMeasure(meas)));
      meas.removeAt(firstMeasure(meas));
    }
    double lat = 0;
    double lng = 0;
    for(var i in measures){
      temp += i.temperature;
      coordinates.add(gMap.LatLng(double.parse(i.latitude), double.parse(i.longitude)));
      lat += coordinates.last.lat.toDouble();
      lng += coordinates.last.lng.toDouble();
    }
    lat /= coordinates.length;
    lng /= coordinates.length;

    center = gMap.LatLng(lat, lng);

    description = order.description;
    duration = minutesToTimeFormat(DateTime.parse(order.datetime_start).difference(DateTime.parse(order.datetime_end)).inMinutes);
    temperature = temp/(measures.length);
    status = (temperature < 0)? "Saudável":"Não saudável";
    driver = "Zezinho";
    return true;
  }

  String minutesToTimeFormat(int m){
    if(m<60){
      return "$m min";
    }
    return "${(m/60).toInt()}h ${m%60}min";
  }
}