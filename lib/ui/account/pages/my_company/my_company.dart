import 'package:embarcados/ui/account/pages/my_company/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:embarcados/ui/account/controller.dart' as c;

class MyCompany extends StatefulWidget {
  final c.Controller controller;
  const MyCompany({Key? key, required this.controller}) : super(key: key);

  @override
  State<MyCompany> createState() => _MyCompanyState();
}

class _MyCompanyState extends State<MyCompany> {
  Controller controller = Controller();
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                const Text("CNPJ: ",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, fontFamily: 'Bungee'),),
                Text(widget.controller.account!.cnpj, style: const TextStyle(fontSize: 20),)
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                const Text("RAZÃO SOCIAL: ",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, fontFamily: 'Bungee'),),
                Text(widget.controller.account!.razao_social, style: const TextStyle(fontSize: 20),)
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                const Text("SEDE: ",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, fontFamily: 'Bungee'),),
                Text(widget.controller.account!.endereco_base, style: const TextStyle(fontSize: 20),)
              ],
            ),
          ),
        ],
      );

  }
}
