import 'package:embarcados/ui/account/pages/my_company/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class MyCompany extends StatefulWidget {
  const MyCompany({Key? key}) : super(key: key);

  @override
  State<MyCompany> createState() => _MyCompanyState();
}

class _MyCompanyState extends State<MyCompany> {
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
                const Text("CNPJ: ",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, fontFamily: 'Bungee'),),
                Text(controller.cnpj, style: const TextStyle(fontSize: 20),)
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                const Text("RAZÃO SOCIAL: ",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, fontFamily: 'Bungee'),),
                Text(controller.socialReason, style: const TextStyle(fontSize: 20),)
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                const Text("SEDE: ",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, fontFamily: 'Bungee'),),
                Text(controller.headOffice, style: const TextStyle(fontSize: 20),)
              ],
            ),
          ),
        ],
      );
    });
  }
}
