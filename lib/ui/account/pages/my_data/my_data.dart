import 'package:embarcados/ui/account/pages/my_data/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class MyData extends StatefulWidget {
  const MyData({Key? key}) : super(key: key);

  @override
  State<MyData> createState() => _MyDataState();
}

class _MyDataState extends State<MyData> {
  Controller controller = Controller();
  @override
  Widget build(BuildContext context) {
    controller.load();
    return Observer(builder: (_){
      return Row(
        children: [
          const Text("Número de contato: ",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, fontFamily: 'Bungee'),),
          Text(controller.contactNumber, style: const TextStyle(fontSize: 20),)
        ],
      );
    });
  }
}
