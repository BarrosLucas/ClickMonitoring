import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'controller.dart';

class InsertNewPass extends StatelessWidget {
  InsertNewPass({Key? key}) : super(key: key);

  Controller controller = Controller();
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_){
        return Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 50,left: 20,right: 20,bottom: 20),
                child: Row(
                  children: [
                    Container(
                      height: 50,
                      padding: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(
                          color: Color(0xFFFFFFFF)
                      ),
                      child: Image.asset("assets/images/padlock.png"),
                    ),
                    Expanded(child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 25),
                      decoration: const BoxDecoration(
                          color: Color(0xFFAEA3BD)
                      ),
                      child: TextField(
                        controller: controller.newP,
                        decoration: const InputDecoration.collapsed(hintText: "Nova senha"),
                        style: const TextStyle(color: Colors.black),
                        obscureText: true,
                        onChanged: (content){
                          controller.validate();
                        },
                      ),
                    ))
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Text("Ao menos 8 dígitos\nPelo menos 1 número\nPelo menos 1 letra maiúscula e 1 minúscula\nPelo menos 1 caractere especial",
                  style: TextStyle(color: (controller.requestsOK)? Colors.green : Colors.red),textAlign: TextAlign.left,),
              ),

              Container(
                margin: const EdgeInsets.only(top: 50,left: 20,right: 20,bottom: 20),
                child: Row(
                  children: [
                    Container(
                      height: 50,
                      padding: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(
                          color: Color(0xFFFFFFFF)
                      ),
                      child: Image.asset("assets/images/padlock.png"),
                    ),
                    Expanded(child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 25),
                      decoration: const BoxDecoration(
                          color: Color(0xFFAEA3BD)
                      ),
                      child: TextField(
                        controller: controller.confirmNewP,
                        decoration: const InputDecoration.collapsed(hintText: "Confirmar nova senha"),
                        style: const TextStyle(color: Colors.black),
                        obscureText: true,
                        onChanged: (content){
                          controller.isPassEquals();
                        },
                      ),
                    ))
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Text("As duas devem ser iguais.",style: TextStyle(color: (controller.passEquals)? Colors.green : Colors.red),textAlign: TextAlign.left,),
              ),
            ],
          ),
        );
      },
    );
  }
}
