import 'dart:html';
import 'dart:js_util';
import 'controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_maps/google_maps.dart' as gMap;
import 'package:google_maps/google_maps.dart';
import 'package:embarcados/appview/controller.dart' as app;
import 'package:google_maps/google_maps_places.dart';
import 'package:mobx/mobx.dart';
import 'dart:ui' as ui;

class Acompanhar extends StatefulWidget {
  final app.Controller appController;
  const Acompanhar({Key? key, required this.appController}):super(key: key);

  @override
  State<Acompanhar> createState() => AcompanharState();
}

class AcompanharState extends State<Acompanhar> {

  late gMap.Polyline poly;
  Controller controller = Controller();

  @override
  Widget build(BuildContext context) {
    controller.load();
    return getMap();
  }

  Widget getMap(){
    String htmlId = "8";

    //a ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(htmlId, (int viewId) {
      final featureOps = <MapTypeStyle>[
        MapTypeStyle()
          ..elementType = "geometry"
          ..stylers =
          [
            jsify({'color': '#f5f5f5'}),
          ],
        MapTypeStyle()
          ..elementType = "labels.icon"
          ..stylers = [
            jsify({'visibility': 'off'}),
          ],
        MapTypeStyle()
          ..elementType = "labels.text.fill"
          ..stylers = [
            jsify({'color': '#616161'}),
          ],
        MapTypeStyle()
          ..elementType = "labels.text.stroke"
          ..stylers = [
            jsify({'color': '#f5f5f5'}),
          ],
        MapTypeStyle()
          ..elementType = "geometry"
          ..featureType = "administrative"
          ..stylers = [
            jsify({'visibility': '#off'}),
          ],
        MapTypeStyle()
          ..elementType = "labels.text.fill"
          ..featureType = "administrative.land_parcel"
          ..stylers = [
            jsify({'color': '#bdbdbd'}),
          ],
        MapTypeStyle()
          ..featureType = "poi"
          ..stylers = [
            jsify({'visibility': 'off'}),
          ],
        MapTypeStyle()
          ..elementType = "geometry"
          ..featureType = "poi"
          ..stylers = [
            jsify({'color': '#eeeeee'}),
          ],
        MapTypeStyle()
          ..elementType = "labels.text.fill"
          ..featureType = "poi"
          ..stylers = [
            jsify({'color': '#757575'}),
          ],
        MapTypeStyle()
          ..elementType = "geometry"
          ..featureType = "poi.park"
          ..stylers = [
            jsify({'color': '#e5e5e5'}),
          ],
        MapTypeStyle()
          ..elementType = "labels.text.fill"
          ..featureType = "poi.park"
          ..stylers = [
            jsify({'color': '#9e9e9e'}),
          ],
        MapTypeStyle()
          ..elementType = "geometry"
          ..featureType = "road"
          ..stylers = [
            jsify({'color': '#ffffff'}),
          ],
        MapTypeStyle()
          ..elementType = "labels.icon"
          ..featureType = "road"
          ..stylers = [
            jsify({'visibility': 'off'}),
          ],
        MapTypeStyle()
          ..elementType = "labels.text.fill"
          ..featureType = "road.arterial"
          ..stylers = [
            jsify({'color': '#757575'}),
          ],
        MapTypeStyle()
          ..elementType = "geometry"
          ..featureType = "road.highway"
          ..stylers = [
            jsify({'color': '#dadada'}),
          ],
        MapTypeStyle()
          ..elementType = "labels.text.fill"
          ..featureType = "road.highway"
          ..stylers = [
            jsify({'color': '#616161'}),
          ],
        MapTypeStyle()
          ..elementType = "labels.text.fill"
          ..featureType = "road.local"
          ..stylers = [
            jsify({'color': '#9e9e9e'}),
          ],
        MapTypeStyle()
          ..featureType = "transit"
          ..stylers = [
            jsify({'visibility': '#off'}),
          ],
        MapTypeStyle()
          ..elementType = "geometry"
          ..featureType = "transit.line"
          ..stylers = [
            jsify({'color': '#e5e5e5'}),
          ],
        MapTypeStyle()
          ..elementType = "geometry"
          ..featureType = "transit.station"
          ..stylers = [
            jsify({'color': '#eeeeee'}),
          ],
        MapTypeStyle()
          ..elementType = "geometry"
          ..featureType = "water"
          ..stylers = [
            jsify({'color': '#c9c9c9'}),
          ],
        MapTypeStyle()
          ..elementType = "labels.text.fill"
          ..featureType = "water"
          ..stylers = [
            jsify({'color': '#9e9e9e'}),
          ],
      ];


      final mapOptions = gMap.MapOptions()
        ..streetViewControl = false
        ..zoomControl = false
        ..fullscreenControl = false
        ..mapTypeControl = false
        ..zoom = 16
        ..center = controller.center
        ..styles = featureOps;

      final elem = DivElement()
        ..id = htmlId
        ..style.width = "100%"
        ..style.height = "100%"
        ..style.border = 'none';

      final map = gMap.GMap(elem, mapOptions);

      final _iconStart = gMap.Icon()
        ..scaledSize = gMap.Size(40, 40)
        ..url = "assets/images/flag.png";
      final _iconNow = gMap.Icon()
        ..scaledSize = gMap.Size(40, 40)
        ..url = "assets/images/truck.png";

      gMap.Marker(gMap.MarkerOptions()
        ..position = controller.coordinates.first
        ..map = map
        ..icon = _iconStart
        ..title = 'Início'
      );

      gMap.Marker(gMap.MarkerOptions()
        ..position = controller.coordinates.last
        ..map = map
        ..icon = _iconNow
        ..title = 'Agora'
      );

      final polyOptions = PolylineOptions()
        ..strokeColor = '#76B2EB'
        ..strokeOpacity = 1.0
        ..strokeWeight = 5;
      poly = Polyline(polyOptions)..map = map;

      for(var i = 0; i < controller.coordinates.length; i++){
        poly.path!
            .push(controller.coordinates.elementAt(i));
      }

      return elem;
    });


    return Observer(
      builder: (_){
        return Stack(
          children: [
            HtmlElementView(viewType: htmlId),
            Positioned(child: windowTapMarker(),bottom: 5,left: 5,),
          ],
        );
      },
    );
  }

  Widget windowTapMarker(){
    return Observer(builder: (_){
      return Container(
        width: 290,
        height: 220,
        padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 20),
        decoration: const BoxDecoration(
            color: Color(0xFFA88C8C),
            borderRadius: BorderRadius.all(Radius.circular(20))
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Descrição da entrega:",style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black,fontSize: 15, fontFamily: 'Inika'),textAlign: TextAlign.left,),
            Text(controller.description,style: TextStyle(color: Colors.black,fontSize: 15, fontFamily: 'Inika'),textAlign: TextAlign.left,),
            Row(
              children: [
                const Text("Velocidade: ",style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black,fontSize: 15, fontFamily: 'Inika'),textAlign: TextAlign.left,),
                Text("${controller.speed}km/h",style: TextStyle(color: Colors.black,fontSize: 15, fontFamily: 'Inika'),textAlign: TextAlign.left,),
              ],
            ),
            Row(
              children: [
                const Text("Temperatura da Carga: ",style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black,fontSize: 15, fontFamily: 'Inika'),textAlign: TextAlign.left,),
                Text("${controller.temperature}° C",style: TextStyle(color: Colors.black,fontSize: 15, fontFamily: 'Inika'),textAlign: TextAlign.left,),
              ],
            ),
            Row(
              children: [
                const Text("Umidade: ",style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black,fontSize: 15, fontFamily: 'Inika'),textAlign: TextAlign.left,),
                Text("${controller.humidity}%",style: TextStyle(color: Colors.black,fontSize: 15, fontFamily: 'Inika'),textAlign: TextAlign.left,),
              ],
            ),
            Row(
              children: [
                const Text("Status da Carga: ",style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black,fontSize: 15, fontFamily: 'Inika'),textAlign: TextAlign.left,),
                Text("${controller.status}",style: TextStyle(color: Colors.black,fontSize: 15, fontFamily: 'Inika'),textAlign: TextAlign.left,)
              ],
            ),
            Row(
              children: [
                const Text("Motorista: ",style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black,fontSize: 15, fontFamily: 'Inika'),textAlign: TextAlign.left,),
                Text("${controller.driver}",style: TextStyle(color: Colors.black,fontSize: 15, fontFamily: 'Inika'),textAlign: TextAlign.left,)
              ],
            ),
          ],
        ),
      );
    });
  }


}