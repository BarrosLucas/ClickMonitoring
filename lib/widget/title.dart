import 'package:flutter/material.dart';
class TitlePage extends StatelessWidget {
  final String title;
  const TitlePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 50, top: 50, bottom: 20),
      child: Text("${title}", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, fontFamily: 'Bungee'),),
    );
  }
}
