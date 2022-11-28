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
  double distance = 0.0;

  @observable
  String duration = "";

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

  @action
  load(){
    coordinates.add(gMap.LatLng(-7.156720864676417, -34.819148543684115));
    coordinates.add(gMap.LatLng(-7.1582625102177735, -34.81907704720505));
    coordinates.add(gMap.LatLng(-7.159012437422982, -34.81905648070658));
    coordinates.add(gMap.LatLng(-7.15965523121472, -34.81901020607993));
    coordinates.add(gMap.LatLng(-7.160226602690753, -34.81900506445531));
    coordinates.add(gMap.LatLng(-7.160184273562869, -34.81969499923967));
    coordinates.add(gMap.LatLng(-7.160167945048046, -34.82006675187673));
    coordinates.add(gMap.LatLng(-7.160170606340052, -34.820490540863055));
    coordinates.add(gMap.LatLng(-7.160172602309305, -34.82067628386886));
    coordinates.add(gMap.LatLng(-7.160188706108194, -34.82144149654936));
    coordinates.add(gMap.LatLng(-7.160198020629949, -34.82175933832783));
    coordinates.add(gMap.LatLng(-7.160247058104406, -34.821839593055));
    coordinates.add(gMap.LatLng(-7.1603022739350415, -34.82176409578376));
    coordinates.add(gMap.LatLng(-7.160318514776921, -34.82165851899757));
    coordinates.add(gMap.LatLng(-7.160415147774143, -34.82167652434096));
    coordinates.add(gMap.LatLng(-7.1605581497652775, -34.82169419471637));
    coordinates.add(gMap.LatLng(-7.16077641277118, -34.82205856474319));
    coordinates.add(gMap.LatLng(-7.16099179114743, -34.82235897623339));
    coordinates.add(gMap.LatLng(-7.161413894006214, -34.8227950574211));
    coordinates.add(gMap.LatLng(-7.161995606868013, -34.823331921803565));
    coordinates.add(gMap.LatLng(-7.162296558855233, -34.82361779727086));
    coordinates.add(gMap.LatLng(-7.162930774777467, -34.82420242358222));
    coordinates.add(gMap.LatLng(-7.163128845033395, -34.824410773491365));
    coordinates.add(gMap.LatLng(-7.16359709814936, -34.82500965831885));
    coordinates.add(gMap.LatLng(-7.163828820765337, -34.82554458457534));
    coordinates.add(gMap.LatLng(-7.163892186772801, -34.82621717764359));
    coordinates.add(gMap.LatLng(-7.163841571088895, -34.82673902596935));
    coordinates.add(gMap.LatLng(-7.1637244368737445, -34.827505162559135));

    stops.add(gMap.LatLng(-7.156720864676417, -34.819148543684115));
    stops.add(gMap.LatLng(-7.160188706108194, -34.82144149654936));
    stops.add(gMap.LatLng(-7.1637244368737445, -34.827505162559135));

    double lat = 0;
    double lng = 0;
    for(var a = 0; a < coordinates.length; a++){
      lat += coordinates.elementAt(a).lat.toDouble();
      lng += coordinates.elementAt(a).lng.toDouble();
    }

    lat /= coordinates.length;
    lng /= coordinates.length;

    center = gMap.LatLng(lat, lng);
    description = "Entrega de carne para o mercadinho";
    distance = 30;
    duration = "1h 30min";
    speed = 10;
    temperature = -20;
    humidity = 100;
    status = "Saudável";
    driver = "Zezinho";

  }
}