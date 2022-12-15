import 'package:embarcados/appview/controller.dart';
import 'package:flutter/material.dart';
class NavigationItem extends StatelessWidget {

  final String title;
  final Controller controller;
  final int page;
  final bool align;

  const NavigationItem({super.key, required this.title, required this.controller, required this.page,this.align = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if(title == 'Acompanhar'){
          if (controller.order != null) {
            controller.setPage(page);
          } else {
            controller.setVisibilityDialog(true);
          }
        }else{
          controller.setPage(page);
        }
      },
      child: Container(
        alignment: (align)? Alignment.centerRight:Alignment.center,
        decoration: const BoxDecoration(
          color: Color(0xFF35185A)
        ),
        margin: const EdgeInsets.only(left: 0.2),
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
        height: 70,
        child: Text(
          title,
          style: const TextStyle(fontSize: 20.0, fontFamily: "Bungee",fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}