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

class Route extends StatefulWidget {
  final app.Controller appController;
  const Route({Key? key, required this.appController}):super(key: key);

  @override
  State<Route> createState() => RouteState();
}

class RouteState extends State<Route> {

  late gMap.Polyline poly;
  Controller controller = Controller();

  @override
  Widget build(BuildContext context) {
    controller.load();
    return Scaffold(
        body:getMap()
    );
  }


  Widget getMap(){
    String htmlId = "9";

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
        ..zoom = 17
        ..center = controller.center
        ..styles = featureOps;

      final elem = DivElement()
        ..id = htmlId
        ..style.width = "100%"
        ..style.height = "100%"
        ..style.border = 'none';

      final map = gMap.GMap(elem, mapOptions);

      for(var i = 0; i < controller.stops.length; i++){
        gMap.Marker(gMap.MarkerOptions()
          ..position = controller.stops.elementAt(i)
          ..map = map
          ..title = 'Hello World!'
        );
      }

      final polyOptions = PolylineOptions()
        ..strokeColor = '#76B2EB'
        ..strokeOpacity = 1.0
        ..strokeWeight = 3;
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
            Positioned(child: getBackButton(),top: 5,left: 5,)
          ],
        );
      },
    );
  }

  Widget windowTapMarker(){
    return Observer(builder: (_){
      return Container(
          width: 350,
          height: 260,
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
                  const Text("Distância Percorrida: ",style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black,fontSize: 15, fontFamily: 'Inika'),textAlign: TextAlign.left,),
                  Text("${controller.distance}km",style: TextStyle(color: Colors.black,fontSize: 15, fontFamily: 'Inika'),textAlign: TextAlign.left,),
                ],
              ),
              Row(
                children: [
                  const Text("Duração: ",style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black,fontSize: 15, fontFamily: 'Inika'),textAlign: TextAlign.left,),
                  Text("${controller.duration}",style: TextStyle(color: Colors.black,fontSize: 15, fontFamily: 'Inika'),textAlign: TextAlign.left,),
                ],
              ),
              Row(
                children: [
                  const Text("Velocidade Média: ",style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black,fontSize: 15, fontFamily: 'Inika'),textAlign: TextAlign.left,),
                  Text("${controller.speed}km/h",style: TextStyle(color: Colors.black,fontSize: 15, fontFamily: 'Inika'),textAlign: TextAlign.left,),
                ],
              ),
              Row(
                children: [
                  const Text("Temperatura Média da Carga: ",style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black,fontSize: 15, fontFamily: 'Inika'),textAlign: TextAlign.left,),
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

  Widget getBackButton(){
    return InkWell(
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: const Color(0xFF35185A)
        ),
        child: Image.asset("assets/images/arrow_back.png",height: 40,width: 40,),
      ),
      onTap: (){
        widget.appController.setPage(3);
      },
    );
  }
}