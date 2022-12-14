import 'package:embarcados/models/measure/MeasureModel.dart';
import 'package:embarcados/models/order/OrderModel.dart';
import 'package:embarcados/request/measures/MeasureRequest.dart';
import 'package:mobx/mobx.dart';
import 'package:google_maps/google_maps.dart' as gMap;
part 'controller.g.dart';

class Controller = ControllerBase with _$Controller;

abstract class ControllerBase with Store{
  @observable
  ObservableList<MeasureModel> ?measures;

  @observable
  ObservableList<gMap.LatLng> coordinates = ObservableList();

  @observable
  gMap.LatLng center = gMap.LatLng(0, 0);

  @observable
  String description = "";

  @observable
  double speed = 0.0;

  @observable
  double temperature = 0.0;

  @observable
  double humidity = 0.0;

  @observable
  String driver = "";

  @observable
  String status = "Ativo";

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
  update(OrderModel order) async{
    MeasureModel ?measureModel = await MeasureRequest().getLastMeasureOpenOrder();
    measures ??= ObservableList.of([]);
    if(measureModel != null){
      if(measures!.isNotEmpty){
        if(measures!.last.id != measureModel!.id){
          coordinates.add(gMap.LatLng(double.parse(measureModel.latitude), double.parse(measureModel.longitude)));
          measures!.add(measureModel!);
        }
      }else{
        coordinates.add(gMap.LatLng(double.parse(measureModel.latitude), double.parse(measureModel.longitude)));
        measures!.add(measureModel!);
      }
    }

    double lat = 0;
    double lng = 0;
    for(var i in coordinates){
      lat += i.lat.toDouble();
      lng += i.lng.toDouble();
    }
    lat /= coordinates.length;
    lng /= coordinates.length;

    center = gMap.LatLng(lat, lng);
    description = order.description;
    speed = measures!.last.speed;
    temperature = measures!.last.temperature;
    humidity = measures!.last.umidity;
    status = (temperature < 0)? "Saudável": "Alerta";
    driver = "José";
  }

  @action
  Future<bool> loadData(OrderModel order) async{
    List<MeasureModel> meas = ObservableList.of(await MeasureRequest().getMeasuresByOrder(order.id));
    measures = ObservableList();
    while(meas.isNotEmpty){
      measures!.add(meas!.elementAt(firstMeasure(meas!)));
      meas!.removeAt(firstMeasure(meas!));
    }
    double lat = 0;
    double lng = 0;
    for(var i in measures!){
      coordinates.add(gMap.LatLng(double.parse(i.latitude), double.parse(i.longitude)));
      lat += coordinates.last.lat.toDouble();
      lng += coordinates.last.lng.toDouble();
    }
    lat /= coordinates.length;
    lng /= coordinates.length;

    center = gMap.LatLng(lat, lng);
    description = order.description;
    speed = measures!.last.speed;
    temperature = measures!.last.temperature;
    humidity = measures!.last.umidity;
    status = (temperature < 0)? "Saudável": "Alerta";
    driver = "José";

    return true;
  }
}