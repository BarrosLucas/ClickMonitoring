import 'package:embarcados/ui/account/pages/my_data/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:embarcados/ui/account/controller.dart' as c;

class MyData extends StatefulWidget {
  final c.Controller controller;
  const MyData({Key? key, required this.controller}) : super(key: key);

  @override
  State<MyData> createState() => _MyDataState();
}

class _MyDataState extends State<MyData> {
  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          const Text("Número de contato: ",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, fontFamily: 'Bungee'),),
          Text(widget.controller.account!.contact, style: const TextStyle(fontSize: 20),)
        ],
      );

  }
}
