import 'package:embarcados/appview/appview.dart';
import 'package:embarcados/ui/home/Home.dart';
import 'package:embarcados/ui/recover_pasword/recover.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return content(context);
  }

  Widget content(BuildContext context){
    return Center(child: Container(
      width: 800,
      height: 530,
      child: Stack(
        children: [
          body(context),
          Align(
            alignment: Alignment.bottomLeft,
            child:
            Container(
              margin: const EdgeInsets.only(left: 40),
              child: getLoginButton(context),),

          )
        ],
      ),
    ));
  }

  Widget body(BuildContext context){
    return Container(
        width: 800,
        height: 500,
        child: Row(
          children: [
            getLeftSide(context),
            getRightSide()
          ],
        ),
      );
  }

  Widget getLeftSide(BuildContext context){
    return Container(
      width: 400,
      height: 500,
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Color(0xFF35185A),
            ),
            width: 430,
            height: 500,
            child: Stack(
              children: [
                getTitle(),
                getInputDataField(),
                getForgetPassOption(context)
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget getLoginButton(BuildContext context){
    return InkWell(
      child: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
            color: Color(0xFFFB806F)
        ),
        width: 320,
        height: 60,
        child: const Text("LOGIN", textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 20),),
      ),
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => AppView()));
      },
    );
  }

  Widget getRightSide(){
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      width: 370,
      height: 500,
      child: Stack(
        children: [
          Center(
            child: Image.asset("assets/images/observable_image.png"),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              width: 150,
              height: 90,
              alignment: Alignment.topRight,
              margin: const EdgeInsets.all(0),
              child: Image.asset("assets/images/logo.png"),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.only(bottom: 30),
              child: const Text("TORNANDO O TRANSPORTE DE\nSUA CARGA MAIS SEGURO!", textAlign: TextAlign.center, style: TextStyle(fontFamily: "Bungee", fontSize: 18),),
            ),
          )
        ],
      )
    );
  }

  Widget getTitle(){
    return Container(
      alignment: Alignment.topCenter,
      margin: const EdgeInsets.only(top: 40),
      child: const Text("LOGIN", textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'Bungee',
          fontWeight: FontWeight.bold,
          fontSize: 35,
        ),),
    );
  }

  Widget getInputDataField(){
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                width: 50,
                height: 45,
                child: const Image(image: AssetImage("assets/images/user.png"),alignment: Alignment.center),
              ),
              Container(
                  decoration: const BoxDecoration(
                    color: Color(0x33FFFFFF),
                  ),
                  padding: EdgeInsets.only(left: 20),
                  width: 250,
                  height: 45,
                  child: const Center(
                    child: TextField(
                      decoration: InputDecoration.collapsed(hintText: "Usuário"),
                      style: TextStyle(color: Colors.black),
                    ),
                  )
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 30),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  width: 50,
                  height: 45,
                  child: const Image(image: AssetImage("assets/images/padlock.png"),alignment: Alignment.center),
                ),
                Container(
                    decoration: const BoxDecoration(
                      color: Color(0x33FFFFFF),
                    ),
                    padding: const EdgeInsets.only(left: 20),
                    width: 250,
                    height: 45,
                    child: const Center(
                      child: TextField(
                        decoration: InputDecoration.collapsed(hintText: "Senha"),
                        style: TextStyle(color: Colors.black),
                        obscureText: true,
                      ),
                    )
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget getForgetPassOption(BuildContext context){
    return Container(
      alignment: Alignment.bottomRight,
      margin: const EdgeInsets.only(right: 70,bottom: 80),
      child: InkWell(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => Recover()));
        },
        child:  const Text("Esqueci minha senha", style: TextStyle(color: Colors.white),),
      ),
    );
  }


}
