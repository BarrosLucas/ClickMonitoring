import 'package:embarcados/ui/account/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
class NavigationVerticalItem extends StatelessWidget {

  final String title;
  final Controller controller;
  final int page;

  const NavigationVerticalItem({super.key, required this.title, required this.controller, required this.page});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.setPage(page);
      },
      child: Observer(
        builder: (_){
          return Container(
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
                color: (controller.page == page)? Color(0xFF200E36) : Color(0xFF35185A)
            ),
            margin: const EdgeInsets.only(left: 0.2),
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            height: 70,
            child: Text(
              title,
              style: TextStyle(fontSize: 20.0, fontFamily: "Bungee",fontWeight: FontWeight.bold, color: (controller.page == page)? Color(0xFF999999): Colors.white),
            ),
          );
        },
      ),
    );
  }
}