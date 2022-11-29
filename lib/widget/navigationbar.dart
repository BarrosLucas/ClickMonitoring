import 'package:embarcados/appview/controller.dart';
import 'package:flutter/material.dart';
import 'navigation_item.dart';

class NavigationBarWeb extends StatefulWidget {
  final Controller controller;
  NavigationBarWeb({super.key, required this.controller});

  @override
  _NavigationBarWebState createState() => _NavigationBarWebState();

}
class _NavigationBarWebState extends State<NavigationBarWeb> {
  @override
  Widget build(BuildContext context) {

    return Container(
      height: 70.0,
      decoration: const BoxDecoration(
        color: Color(0xFF35185A),
      ),
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              InkWell(
                child: Container(
                  decoration: const BoxDecoration(
                      color: Color(0xFFD9D9D9)
                  ),
                  height: 70,
                  width: 200,
                  child: Image.asset( "assets/images/logo.png"),
                ),
                onTap: (){
                  widget.controller.setPage(0);
                },
              ),

              NavigationItem(
                title: 'Acompanhar',
                controller: widget.controller,
                page: 1,
              ),
              NavigationItem(
                title: 'Entregas',
                controller: widget.controller,
                page: 3,
              ),
              Expanded(child: NavigationItem(
                  title: 'Minha Conta',
                  controller: widget.controller,
                  page: 6,
                align: true,
              ),)
            ],
          )
        ],
      ),
    );
  }
}