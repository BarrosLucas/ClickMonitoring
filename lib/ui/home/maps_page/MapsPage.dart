import 'dart:html';
import 'dart:ui' as ui;
import 'package:embarcados/ui/home/maps_page/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_maps/google_maps.dart' as gMap;
import 'package:google_maps/google_maps.dart';
import 'package:google_maps/google_maps_places.dart';
import 'package:mobx/mobx.dart';


class MapsPage extends StatefulWidget {
  @override
  State<MapsPage> createState() => MapsPageState();
}

class MapsPageState extends State<MapsPage> {
  Controller controller = Controller();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:getMap()
    );


  }


  Widget getMap(){
    String htmlId = "7";

    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(htmlId, (int viewId) {
      final myLatlng = gMap.LatLng(-7.1622872,-34.8215855);

      final mapOptions = gMap.MapOptions()
        ..streetViewControl = false
        ..zoomControl = false
        ..fullscreenControl = false
        ..mapTypeControl = false
        ..zoom = 15
        ..center = gMap.LatLng(-7.1622872,-34.8215855);

      final elem = DivElement()
        ..id = htmlId
        ..style.width = "100%"
        ..style.height = "100%"
        ..style.border = 'none';

      final map = gMap.GMap(elem, mapOptions);

      final _icon = gMap.Icon()
        ..scaledSize = gMap.Size(40, 60)
        ..url = "assets/images/marker.png";

      final marker = gMap.Marker(gMap.MarkerOptions()
        ..position = myLatlng
        ..map = map
        ..icon = _icon
        ..title = 'Hello World!'
      );

      marker.onClick.listen((e) {
        setState(() {
          controller.setVisible(true,"Entrega de carne para o mercadinho",10.0,-30.0,100,"Saudável");
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