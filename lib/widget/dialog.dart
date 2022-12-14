import 'package:embarcados/appview/controller.dart';
import 'package:flutter/material.dart';

class Dialog extends StatelessWidget {
  final String title;
  final String content;
  final Controller controller;
  const Dialog({Key? key, required this.title, required this.content, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(left: 0,right: 0,top: 0,bottom: 0,
        child: Expanded(
          child: InkWell(
            child: Container(
              decoration: const BoxDecoration(
                  color: Color(0xC5000000)
              ),
              child: Center(
                child: Container(
                  height: 200,
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                      color: Color(0xFFD9D9D9)
                  ),
                  child: Column(
                    children: [
                      Text("${title}", style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold, fontFamily: 'Bungee'),textAlign: TextAlign.center,),
                      Container(
                        margin: const EdgeInsets.only(top: 80,left: 10,right: 10),
                        child: Text("${content}", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Bungee'),textAlign: TextAlign.center,),
                      )
                    ],
                  ),
                ),
              ),
            ),
            onTap: (){
              controller.setVisibilityDialog(false);
            },
          ),
        ),)
      ],
    );
  }
}
