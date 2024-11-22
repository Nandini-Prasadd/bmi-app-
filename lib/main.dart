import 'dart:ui';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_first_project/SplashPage.dart';
import 'package:my_first_project/StartPage.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: Splashpage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

 class _MyHomePageState extends State<MyHomePage> {

   var weight = TextEditingController();
   var feet = TextEditingController();
   var inches = TextEditingController();
   var nameText = TextEditingController();
   var result = '';
   var health = '';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade300,
        title:Center(
          child: Text('Calculate BMI', style: TextStyle(fontSize: 18, color: Colors.white, fontWeight:FontWeight.w400 ),),
        ),
      ),

      body: Container(
        color: Colors.purple.shade50,
        child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      keyboardType: TextInputType.text,
                      controller: nameText,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.account_circle_rounded, color: Colors.purple.shade200,),
                          label: Text('Enter your Name'),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)
                          ),
                        )
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:10.0),
                      child: TextField(
                          keyboardType: TextInputType.number,
                          controller: weight,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.monitor_weight, color: Colors.purple.shade200, size: 25,),
                            label: Text('Enter your weight in kgs'),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)
                            ),
                          ),
                        ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:10.0),
                      child: TextField(
                          keyboardType: TextInputType.number,
                          controller: feet,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.height, color: Colors.purple.shade200,),
                            label: Text('Enter your height (feet)'),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30)
                            ),
                          )
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: TextField(
                          keyboardType: TextInputType.number,
                          controller: inches,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.height, color: Colors.purple.shade200,),
                            label: Text('Enter your height (inches)'),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30)
                            ),
                          )
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:60.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top:8.0),
                            child: ElevatedButton(
                              onPressed: (){
                                var wt = int.parse(weight.text.toString());
                                var ft = int.parse(feet.text.toString());
                                var inc = int.parse(inches.text.toString());

                                if(wt!= null && ft != null && inc!= null){
                                  setState(() {
                                    var tinc = (ft*12)+inc;
                                    var tcm = tinc*2.54;
                                    var tm = tcm/100;
                                    var bmi = wt/(tm*tm);
                                    result='Your BMI is ${bmi.toStringAsFixed(2)}';
                                    if(bmi < 18.5){
                                      health = 'You\'re underweight';
                                    }
                                    else if (bmi >= 18.5 && bmi < 25){
                                      health = 'You\'re Healthy';
                                    }
                                    else if(bmi>=25){
                                      health = 'You\'re Overweight';
                                    }
                                  });

                                }
                                else{
                                  setState(() {
                                    result = 'Please enter all the required values';
                                  });
                                }
                              },
                              child: Text('Calculate BMI'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, left: 20),
                      child: Text(result, style: TextStyle(fontSize: 16, color: Colors.purple.shade300),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, left: 20),
                      child: Text(health, style: TextStyle(fontSize: 16, color: Colors.purple.shade300),),
                    )
                  ],
                ),
              ),
            ),
        ),
      )


    );
  }
}

