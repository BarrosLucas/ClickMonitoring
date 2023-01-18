import 'package:flutter/material.dart';
import 'dart:js' as js;
class Support extends StatelessWidget {
  const Support({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("entrar em contato com o suporte é rápido e fácil! para isso, basta clicar no botão abaixo!", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, fontFamily: 'Bungee'),textAlign: TextAlign.center,),
        Text("Funcionamento: 08:00 até 08:05", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, fontFamily: 'Bungee'),textAlign: TextAlign.start,),
        Text("(apenas dias úteis)", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, fontFamily: 'Bungee'),textAlign: TextAlign.start,),
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
  }
}
