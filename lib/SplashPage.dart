import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_first_project/StartPage.dart';
import 'package:my_first_project/main.dart';

class Splashpage extends StatefulWidget{
  @override
  State<Splashpage> createState() => _SplashpageState();
}

class _SplashpageState extends State<Splashpage> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 5),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Startpage(),),);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [
              Colors.purple.shade100,
              Colors.purple.shade200,
              // Colors.purple.shade300
            ],
            // center: Alignment.topCenter,
          )

          // LinearGradient(
          //   colors: [
          //     Colors.purple.shade300,            //Color(0xff666666) 0x: hexadecimal, ff:opacity
          //     Colors.purple.shade200,
          //     Colors.purple.shade100
          //   ],
          //   begin: FractionalOffset(0.0,0.0),
          //   end: FractionalOffset(1.0,1.0)
          // )
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FaIcon(FontAwesomeIcons.bowlFood, color: Colors.white, size: 32,),
              Padding(
                padding: const EdgeInsets.only(left:12.0),
                child: Text('BMI', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white),),
              )
            ],
          )
        ),
      ),
    );
  }
}