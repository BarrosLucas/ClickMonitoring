import 'package:flutter/material.dart';
import 'controller.dart';
class InsertCode extends StatelessWidget {
  InsertCode({Key? key}) : super(key: key);

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
                Expanded(child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 25),
                  decoration: const BoxDecoration(
                      color: Color(0xFFAEA3BD)
                  ),
                  child: TextField(
                    controller: controller.controller,
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration.collapsed(hintText: "Código"),
                    style: const TextStyle(color: Colors.black, fontFamily: 'Bungee', fontSize: 15),
                    onChanged: (content){
                    },
                  ),
                ))
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Text("Um código foi enviado para seu e-mail.",style: TextStyle(color: Colors.white),textAlign: TextAlign.left,),
          ),
          InkWell(
            onTap: (){},
            child: Container(
              margin: EdgeInsets.only(left: 20,right: 20,top: 20),
              child: Text("Reenviar código",style: TextStyle(color: Colors.white),textAlign: TextAlign.left,),
            ),
          )
        ],
      ),
    );
  }

}
