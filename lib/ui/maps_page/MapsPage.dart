import 'dart:async';
import 'dart:html';
import 'dart:js_util';
import 'dart:ui' as ui;
import 'package:embarcados/appview/controller.dart' as appC;
import 'package:embarcados/ui/maps_page/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_maps/google_maps.dart' as gMap;
import 'package:google_maps/google_maps.dart';


class MapsPage extends StatefulWidget {
  appC.Controller controller;
  MapsPage({super.key, required this.controller});

  @override
  State<MapsPage> createState() => MapsPageState();
}

class MapsPageState extends State<MapsPage> {
  Controller controller = Controller();
  gMap.Marker ?marker;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    try{
      Timer.periodic(const Duration(seconds: 15), (Timer t) {
        setState(() {
          if(marker != null){
            marker!.position = controller.currentCoordinates;
            print("Set position");
          }

        });
      });
    }catch(e){
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    controller.updateInfo(widget.controller.order!);
    return Observer(
      builder: (_){
        return getMap();
      },
    );
  }


  Widget getMap(){
    String htmlId = "7";

    // ignore: undefined_prefixed_name
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

      var mapOptions = gMap.MapOptions()
        ..streetViewControl = false
        ..zoomControl = false
        ..fullscreenControl = false
        ..mapTypeControl = false
        ..zoom = 15
        ..center = controller.currentCoordinates
        ..styles = featureOps;

      final elem = DivElement()
        ..id = htmlId
        ..style.width = "100%"
        ..style.height = "100%"
        ..style.border = 'none';

      final map = gMap.GMap(elem, mapOptions);

      final _icon = gMap.Icon()
        ..scaledSize = gMap.Size(40, 60)
        ..url = "assets/images/marker.png";

      marker = gMap.Marker(gMap.MarkerOptions()
        ..position = controller.currentCoordinates
        ..map = map
        ..icon = _icon
        ..title = 'Hello World!'
      );

      marker!.onClick.listen((e) {
        setState(() {
          controller.setVisible(true,
              widget.controller.order!.description,
              widget.controller.lastMeasure!.speed,
              widget.controller.lastMeasure!.temperature,
              widget.controller.lastMeasure!.umidity,
              (widget.controller.lastMeasure!.temperature < 5)?
                  "Saudável":"Alerta"
          );
        });
      });

      return elem;
    });


    return Stack(
      children: [
        HtmlElementView(viewType: htmlId),
        backgroundWindow(),
        windowTapMarker()
      ],
    );
  }

  Widget backgroundWindow(){
    return Observer(builder: (_){
      return Visibility(visible: controller.visible,child: InkWell(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
              color: Color(0x00FFFFFF)
          ),
        ),
        onTap: (){
          controller.setVisible(false,"",0.0,0.0,0.0,"");
        },
      ),);
    });
  }

  Widget windowTapMarker(){
    return Observer(builder: (_){
      return Center(child: Visibility(
        visible: controller.visible,
        child: Container(
          width: 270,
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
                  const Text("Velocidade: ",style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black,fontSize: 15, fontFamily: 'Inika'),textAlign: TextAlign.left,),
                  Text("${controller.speed}km/h",style: TextStyle(color: Colors.black,fontSize: 15, fontFamily: 'Inika'),textAlign: TextAlign.left,),
                ],
              ),
              Row(
                children: [
                  const Text("Temperatura: ",style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black,fontSize: 15, fontFamily: 'Inika'),textAlign: TextAlign.left,),
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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      margin: const EdgeInsets.only(top: 20),
                      padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 10),
                      child: const Text("ACOMPANHAR", style: TextStyle(color: Colors.white),),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ));
    });
  }
}