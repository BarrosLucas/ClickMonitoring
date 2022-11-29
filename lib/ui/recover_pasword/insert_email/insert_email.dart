import 'package:flutter/material.dart';
import 'controller.dart';
import '../controller.dart' as app;


class InsertEmail extends StatelessWidget {
  final app.Controller appController;
  InsertEmail({Key? key, required this.appController}) : super(key: key);


  Controller controller = Controller();
  @override
  Widget build(BuildContext context) {
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
                      child: Image.asset("assets/images/user.png"),
                    ),
                    Expanded(child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 25),
                      decoration: const BoxDecoration(
                          color: Color(0xFFAEA3BD)
                      ),
                      child: TextField(
                        controller: controller.emailController,
                        decoration: const InputDecoration.collapsed(hintText: "user@exemplo.com"),
                        style: const TextStyle(color: Colors.black),
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
            child: Text("Enviaremos um código para seu e-mail recuperação de sua senha",style: TextStyle(color: Colors.white),textAlign: TextAlign.left,),
          )
            ],
      ),
    );
  }
}
