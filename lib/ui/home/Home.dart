import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFFF0F0EB)
      ),
      child: body(),
    );
  }

  Widget body(){
    return Center(
      child: Container(
        width: 900,
        height: 500,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                truckIcon(),
                userIcon()
              ],
            ),
            Container(
              width: 250,
              height: 330,
              margin: EdgeInsets.only(left: 50),
              decoration: const BoxDecoration(
                color: Color(0xFFFB806F)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("+",textAlign: TextAlign.center,style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontFamily: "Bungee", fontSize: 120),),
                  Text("NOVA ENTREGA",textAlign: TextAlign.center,style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontFamily: "Bungee", fontSize: 40),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget truckIcon(){
    return Container(
      width: 600,
      height: 150,
      decoration: const BoxDecoration(
        color: Color(0xFF35185A)
      ),
      child: Row(
       mainAxisAlignment: MainAxisAlignment.center,
       crossAxisAlignment: CrossAxisAlignment.center,
       children: [
         Container(
           width: 70,
           height: 70,
           margin: EdgeInsets.only(right: 20),
           child: Image.asset("assets/images/vehicle.png"),),
         const Text("ENTREGAS", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontFamily: "Bungee",fontSize: 60),)
       ],
      ),
    );
  }

  Widget userIcon(){
    return Container(
      width: 600,
      height: 150,
      decoration: const BoxDecoration(
          color: Color(0xFF35185A)
      ),
      margin: EdgeInsets.only(top: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 70,
            height: 70,
            margin: EdgeInsets.only(right: 20),
            child: Image.asset("assets/images/user1.png"),),
          const Text("MINHA CONTA", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontFamily: "Bungee",fontSize: 60),)
        ],
      ),
    );
  }

}
