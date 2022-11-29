import 'package:cached_network_image/cached_network_image.dart';
import 'package:embarcados/ui/account/pages/my_data/my_data.dart';
import 'package:embarcados/ui/account/pages/my_company/my_company.dart';
import 'package:embarcados/ui/account/pages/my_plan/my_plan.dart';
import 'package:embarcados/ui/account/pages/safety/safety.dart';
import 'package:embarcados/ui/account/pages/support/support.dart';
import 'package:embarcados/widget/title.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'controller.dart';
import 'package:embarcados/widget/navigation_item_vertical.dart';
import 'package:flutter/material.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  final Controller controller = Controller();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Expanded(child:
            Container(
              width: MediaQuery.of(context).size.width*0.3,
              decoration: const BoxDecoration(
                  color: Color(0xff35185A)
              ),
              child: Stack(
                children: [
                  Column(
                    children: [
                      NavigationVerticalItem(controller: controller,page: 0,title: "MEUS DADOS",),
                      NavigationVerticalItem(controller: controller,page: 1,title: "MINHA EMPRESA",),
                      NavigationVerticalItem(controller: controller,page: 2,title: "MEU PLANO",),
                      NavigationVerticalItem(controller: controller,page: 3,title: "SEGURANÇA",),
                      NavigationVerticalItem(controller: controller,page: 4,title: "SUPORTE",)
                    ],
                  ),
                  const Positioned(
                    bottom: 10,
                    left: 30,
                    right: 30,
                    child: Text("1.0.0\nCopyright © 2022 – 2023 ClickMonitoring – Todos os direitos reservados.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15.0, fontFamily: "Bungee",fontWeight: FontWeight.bold, color: Colors.white,),
                  )
                ),
                ]
              )
            ))
          ],
        ),
        Expanded(child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const TitlePage(title: "MEUS DADOS",align: TitlePage.RIGHT,),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: CachedNetworkImage(
                  imageUrl: "http://via.placeholder.com/350x150",
                  placeholder: (context, url) => const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Image.asset("assets/images/logo_client.png"),
                ),
              ),
              Observer(
                builder: (_){
                  Widget widget = Container();
                  switch(controller.page){
                    case 0:
                      widget = const MyData();
                      break;
                    case 1:
                      widget = const MyCompany();
                      break;
                    case 2:
                      widget = const MyPlan();
                      break;
                    case 3:
                      widget = const Safety();
                      break;
                    case 4:
                      widget = const Support();
                      break;
                  }
                  return Expanded(child:
                    Container(
                      alignment: Alignment.topLeft,
                      margin: const EdgeInsets.only(top: 40),
                      child: widget,
                    )
                  );
                },
              )
            ],
          ),
        ))
      ],
    );
  }
}
