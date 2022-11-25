import 'package:embarcados/ui/entregas/controller.dart';
import 'package:embarcados/widget/column_table_data.dart';
import 'package:embarcados/widget/title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class Entregas extends StatefulWidget {
  const Entregas({Key? key}) : super(key: key);

  @override
  State<Entregas> createState() => _EntregasState();
}

class _EntregasState extends State<Entregas> {
  Controller controller = Controller();
  @override
  Widget build(BuildContext context) {
    controller.loadData();
    
    return Stack(
      children: [
        body(),
      ],
    );
  }

  Widget body(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const TitlePage(title: "TODAS AS ENTREGAS"),
        listDeliveries()
      ],
    );
  }

  Widget listDeliveries(){


    return Observer(builder: (_){
      List<Widget> icons = [];
      for(var a = 0; a < controller.startsList.length; a++){
        icons.add(Image.asset("assets/images/search.png",height: 25,width: 25,));
      }

      List<String> stops = [];
      for(var a = 0; a < controller.stopsList.length; a++){
        stops.add(controller.stopsList.elementAt(a).toString());
      }

      return Container(
        margin: const EdgeInsets.only(left: 50,right: 50,top: 30),
        height: 450,
        padding: const EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
            color: const Color(0xFFFFFFFF),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade600,
                  spreadRadius: 1,
                  blurRadius: 2
              )
            ]
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: ColumnDataTable(titleColumn: "INÍCIO", data: controller.startsList),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: ColumnDataTable(titleColumn: "FIM", data: controller.finishesList),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: ColumnDataTable(titleColumn: "TRAJETO", widgets: icons),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: ColumnDataTable(titleColumn: "QUANT. DE PARADAS", data: stops),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: ColumnDataTable(titleColumn: "HISTÓRICO DE TEMP.", widgets: icons),
            ),
          ],
        ),
      );
    });
  }
}
