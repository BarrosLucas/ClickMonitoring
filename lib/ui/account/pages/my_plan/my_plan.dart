import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'controller.dart';

class MyPlan extends StatefulWidget {
  const MyPlan({Key? key}) : super(key: key);

  @override
  State<MyPlan> createState() => _MyPlanState();
}

class _MyPlanState extends State<MyPlan> {
  Controller controller = Controller();
  @override
  Widget build(BuildContext context) {
    controller.load();
    return Observer(builder: (_){
      return Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                const Text("INÍCIO: ",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, fontFamily: 'Bungee'),),
                Text(controller.dateStart, style: const TextStyle(fontSize: 20),)
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                const Text("DATA DE ENCERRAMENTO: ",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, fontFamily: 'Bungee'),),
                Text(controller.dateFinish, style: const TextStyle(fontSize: 20),)
              ],
            ),
          ),
        ],
      );
    });
  }
}
