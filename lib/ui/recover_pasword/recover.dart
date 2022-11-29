import 'package:embarcados/ui/recover_pasword/controller.dart';
import 'package:embarcados/ui/recover_pasword/insert_email/insert_email.dart';
import 'package:embarcados/ui/recover_pasword/insert_code/insert_code.dart';
import 'package:embarcados/ui/recover_pasword/insert_new_pass/insert_new_pass.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class Recover extends StatefulWidget {
  const Recover({Key? key}) : super(key: key);

  @override
  State<Recover> createState() => _RecoverState();
}

class _RecoverState extends State<Recover> {
  Controller controller = Controller();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(),
    );
  }

  Widget body(){
    return Observer(
      builder: (_){
        return Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
              color: Color(0xFFF5F5F5)
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
                        const Text("RECUPERAR SENHA", style: TextStyle(fontFamily: 'Bungee',color: Colors.white,fontSize: 40),),
                        contentView()

                      ],
                    ),
                  ),

                  Positioned(
                      bottom: 0,
                      left: 160,
                      right: 160,
                      child: InkWell(
                        onTap: (){
                          if(controller.enableButton){
                            if(controller.page == 0){
                              controller.setPage(1);
                            }else if(controller.page == 1){
                              controller.setPage(2);
                            }else{
                              Navigator.of(context).pop();
                            }
                          }
                        },

                        child: Container(
                          decoration: BoxDecoration(
                              color: (controller.enableButton)? Color(0xFFFB806F) : Color(0xFFCACACA)
                          ),
                          height: 60,
                          child: Center(
                            child: Text(
                              '${controller.buttonContent}',
                              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ))
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget contentView(){
    Widget widget = Container();
    switch(controller.page){
      case 0:
        widget = InsertEmail(appController: controller,);
        break;
      case 1:
        widget = InsertCode();
        break;
      case 2:
        widget = InsertNewPass();
        break;
    }
    return widget;
  }
}
