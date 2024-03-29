import 'dart:async';

import 'package:embarcados/appview/controller.dart';
import 'package:embarcados/ui/account/account.dart';
import 'package:embarcados/ui/acompanhar/Acompanhar.dart';
import 'package:embarcados/ui/entregas/Entregas.dart';
import 'package:embarcados/ui/history/History.dart';
import 'package:embarcados/ui/home/Home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../widget/navigationbar.dart';
import '../ui/maps_page/MapsPage.dart';
import 'package:embarcados/widget/dialog.dart' as d;
import 'package:embarcados/ui/delivery_route/Route.dart' as R;
class AppView extends StatefulWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  final Controller controller = Controller();

  @override
  void initState(){
    Timer.periodic(const Duration(seconds: 15), (Timer t) {
      controller.verifyOrder();
    });
  }

  @override
  Widget build(BuildContext context) {
    controller.loadInfo();
    return Observer(builder: (_){
      return Scaffold(
        body: Stack(
          children: [
            Observer(
              builder: (_){
                return Scaffold(
                  backgroundColor: const Color(0xFFF5F5F5),
                  body: Stack(
                    children: [
                      Column(
                        children: [NavigationBarWeb(controller: controller,), Expanded(child: page())],
                      ),
                      Positioned(
                          left: 0,
                          bottom: 0,
                          right: 0,
                          top: 0,
                          child: Visibility(
                            visible: controller.newDeliveryPageVisible,
                            child: newDeliverRegisterPage(),
                          ))
                    ],
                  ),
                );
              },
            ),
            Visibility(child: d.Dialog(title: "Não há carros em rota",content: "Não há nenhum carro em rota no momento.",controller: controller,),visible: controller.visibleDialog,)
          ],
        ),
      );
    });
  }

  Widget page(){
    return Observer(
      builder: (_){
        if(controller.loadingInfo){
          return const Center(child: CircularProgressIndicator(),);
        }else {
          switch (controller.page) {
            case 2:
              return Home(appController: controller,);
            case 1:
              return Acompanhar(appController: controller);
            case 3:
              return Entregas(appViewController: controller,);
            case 4:
              return History(orderModel: controller.orderCurrentClick!,);
            case 5:
              return R.Route(appController: controller,);
            case 6:
              return Account();
          }
          return MapsPage(key: UniqueKey(),controller: controller,);
        }
      },
    );
  }

  Widget newDeliverRegisterPage(){
    return InkWell(
      onTap: (){
        controller.setPageVisibleNewDelivery(false);
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            color: Color(0xC4000000)
        ),
        child: Center(
          child: Container(
            width: 800,
            height: 530,
            child: Stack(
              children: [
                Container(
                  width: 800,
                  height: 500,
                  padding:const EdgeInsets.symmetric(vertical: 15,horizontal: 10),
                  decoration: const BoxDecoration(
                      color: Color(0xFF35185A)
                  ),
                  child: Column(
                    children: [
                      const Text("NOVA ENTREGA", style: TextStyle(fontFamily: 'Bungee',fontWeight: FontWeight.bold, color: Colors.white,fontSize: 40),),
                      Container(
                        margin: const EdgeInsets.only(top: 50,left: 20,right: 20),
                        child: Row(
                          children: [
                            Container(
                              height: 50,
                              padding: const EdgeInsets.all(5),
                              decoration: const BoxDecoration(
                                  color: Color(0xFFFFFFFF)
                              ),
                              child: Image.asset("assets/images/origin.png"),
                            ),
                            Expanded(child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 25),
                              decoration: const BoxDecoration(
                                  color: Color(0xFFAEA3BD)
                              ),
                              child: TextField(
                                controller: controller.origin,
                                decoration: const InputDecoration.collapsed(hintText: "Origem"),
                                style: const TextStyle(color: Colors.black),
                              ),
                            ))
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 40,left: 20,right: 20),
                        child: Row(
                          children: [
                            Container(
                              height: 50,
                              padding: const EdgeInsets.all(5),
                              decoration: const BoxDecoration(
                                  color: Color(0xFFFFFFFF)
                              ),
                              child: Image.asset("assets/images/destiny.png"),
                            ),
                            Expanded(child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 25),
                              decoration: const BoxDecoration(
                                  color: Color(0xFFAEA3BD)
                              ),
                              child: TextField(
                                controller: controller.destiny,
                                decoration: InputDecoration.collapsed(hintText: "Destino"),
                                style: TextStyle(color: Colors.black),
                              ),
                            ))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: InkWell(
                      onTap: (){
                        controller.newOrder();
                        controller.setPageVisibleNewDelivery(false);
                      },
                      child: Container(
                          height: 60,
                          margin: const EdgeInsets.symmetric(horizontal: 240),
                          color: const Color(0xFFFB806F),
                          child: const Center(
                            child: Text(
                              "INICIAR",
                              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),
                              textAlign: TextAlign.center,
                            ),
                          )
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
