import 'package:embarcados/appview/controller.dart';
import 'package:embarcados/ui/acompanhar/Acompanhar.dart';
import 'package:embarcados/ui/entregas/Entregas.dart';
import 'package:embarcados/ui/home/Home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../widget/navigationbar.dart';
class AppView extends StatefulWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  final Controller controller = Controller();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [NavigationBarWeb(controller: controller,), Expanded(child: page())],
      ),
    );
  }

  Widget page(){
    return Observer(
      builder: (_){
        switch(controller.page){
          case 1:
            return Home();
          case 2:
            return Acompanhar();
          case 3:
            return Entregas();
        }
        return Home();
      },
    );
  }
}
