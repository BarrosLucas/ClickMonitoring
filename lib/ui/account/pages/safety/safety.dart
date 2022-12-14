import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'controller.dart';
import 'package:embarcados/ui/account/controller.dart' as c;
import 'dart:js' as js;

class Safety extends StatefulWidget {
  final c.Controller controller;
  const Safety({Key? key, required this.controller}) : super(key: key);

  @override
  State<Safety> createState() => _SafetyState();
}

class _SafetyState extends State<Safety> {
  Controller controller = Controller();
  @override
  Widget build(BuildContext context) {
    controller.load();
    return Observer(builder: (_){
      return Column(
        children: [
          Text("prezando pela sua segurança, entre em contato direto com nosso suporte para realizar alterações em sua conta!", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, fontFamily: 'Bungee'),textAlign: TextAlign.center,),
          Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: (){
                      js.context.callMethod('open', ['https://wa.me/5583996484068/?text=Ol%C3%A1%21+Gostaria+de+um+contato+para+suporte+no+meu+servi%C3%A7o+da+ClickMonitoring.']);
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 10),
                      height: 40,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 55, vertical: 10),
                      decoration: const BoxDecoration(
                          color:  Color(0xFFFB806F)
                      ),
                      child: const Text("SUPORTE", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,color: Colors.white),),
                    ),
                  )
                ],
              )),
        ],
      );
    });
  }

  Widget body(){
    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  const Text("E-MAIL: ",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, fontFamily: 'Bungee'),),
                  Text(widget.controller.account!.email, style: const TextStyle(fontSize: 20),)
                ],
              ),
            ),

            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: const Text("MUDANÇA DE SENHA: ",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, fontFamily: 'Bungee'),),
            ),

            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  const Text("SENHA ATUAL: ",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, fontFamily: 'Bungee'),),
                  Container(
                    width: 300,
                    padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 5),
                    decoration: const BoxDecoration(
                        color: Colors.white
                    ),
                    child:TextField(
                      controller: controller.currentP,
                      decoration: const InputDecoration.collapsed(hintText: "Usuário"),
                      style: const TextStyle(color: Colors.black),
                      obscureText: true,
                      onChanged: (content){
                        controller.validate();
                      },
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  Container(
                    margin:const EdgeInsets.only(right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text("NOVA SENHA: ",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, fontFamily: 'Bungee'),),
                        Container(
                          width: 300,
                          margin: const EdgeInsets.only(top: 10),
                          padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 5),
                          decoration: const BoxDecoration(
                              color: Colors.white
                          ),
                          child: TextField(
                            controller: controller.newP,
                            decoration: const InputDecoration.collapsed(hintText: "Senha"),
                            style: const TextStyle(color: Colors.black),
                            onChanged: controller.validate(),
                            obscureText: true,
                          ),
                        )
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text("CONFIRMAR NOVA SENHA: ",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, fontFamily: 'Bungee'),),
                      Container(
                        width: 300,
                        margin: const EdgeInsets.only(top: 10),
                        padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 5),
                        decoration: const BoxDecoration(
                            color: Colors.white
                        ),
                        child: TextField(
                          controller: controller.confirmNewP,
                          decoration: const InputDecoration.collapsed(hintText: "Confirmar Nova Senha"),
                          style: const TextStyle(color: Colors.black),
                          onChanged: controller.validate(),
                          obscureText: true,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
                child: Visibility(
                  visible: !controller.enableButton,
                  child: const Text(
                    "Ao menos 8 dígitos\nPelo menos 1 número\nPelo menos 1 letra maiúscula e 1 minúscula\nPelo menos 1 caractere especial\nSenha e confirmação devem ser iguais",
                    style: TextStyle(color: Color(0xFF818181),fontSize: 12),
                  ),
                )
            )



          ],
        ),
        Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: (){
                    if(controller.enableButton){
                      controller.setPassword();
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(horizontal: 55, vertical: 10),
                    decoration: BoxDecoration(
                        color: (controller.enableButton)? Color(0xFFFB806F) : Color(0xFFcacaca)
                    ),
                    child: const Text("PRONTO", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,color: Colors.white),),
                  ),
                )
              ],
            )),
        Visibility(
          visible: controller.successChangedPass,
          child: Positioned(
              bottom: 0,
              top: 0,
              left: 0,
              right: 0,
              child: InkWell(
                onTap: (){
                  controller.setSuccessEnable(false);
                },
                child: Center(
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 50),
                    child: const Text("SENHA ALTERADA COM SUCESSO!",style: TextStyle(fontSize: 20),),
                  ),
                ),
              )),
        )
      ],
    );
  }
}
