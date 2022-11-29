import 'package:flutter/material.dart';
class TitlePage extends StatelessWidget {
  final String title;
  final int align;
  const TitlePage({Key? key, required this.title, this.align = 0}) : super(key: key);
  final int LEFT = 0;
  final int CENTER = 1;
  static const int RIGHT = 2;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: (align == LEFT)? Alignment.centerLeft : (align == CENTER)? Alignment.center : Alignment.centerRight,
      margin: const EdgeInsets.only(left: 50, top: 50, bottom: 20),
      child: Text("${title}", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, fontFamily: 'Bungee'),textAlign: TextAlign.start,),
    );
  }
}
