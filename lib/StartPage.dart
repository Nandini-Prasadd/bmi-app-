import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_first_project/main.dart';
import 'dart:ui';

class Startpage extends StatefulWidget{

  @override
  State<Startpage> createState() => _StartpageState();
}

class _StartpageState extends State<Startpage> {
  var emailText = TextEditingController();
  var passText = TextEditingController();
  var msg = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Welcome', style: TextStyle(fontSize: 18, color: Colors.white, fontWeight:FontWeight.w400 ),
              ),
        ),
        backgroundColor: Colors.purple.shade300,
      ),
      body: Container(
        color: Colors.purple.shade50,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top:10),
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      controller: emailText,
                      decoration: InputDecoration(
                          hintText:'Email',
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Colors.blue,
                                  width: 1.5
                              )
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.blueGrey,
                              )
                          ),
                          // prefixText: 'USERNAME',
                          prefixIcon: Icon(Icons.email, color: Colors.deepPurple,) //same for suffix, can also add widget using prefix or suffix
                          )
                      ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextField(
                      // enabled: false,
                      controller: passText,
                      obscureText: true,
                      //obscuringCharacter: '*',
                      decoration: InputDecoration(
                          hintText:'Password',
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Colors.blue,
                                  width: 1.5
                              )
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Colors.blueGrey
                              )
                          ),
                          disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Colors.redAccent
                              )
                          ),
                          prefixIcon: Icon(Icons.password, color: Colors.deepPurple,)
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: ElevatedButton(onPressed: (){
                      String email = emailText.text.toString();
                      String pass = passText.text;
                      // String name = nameText.text.toString();
                      print('Email= $email, Pass= $pass');
                      if(email!='' && pass!=''){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyHomePage(),));}
                      else (setState(() {
                        msg = 'Please fill all the required values';
                      })
                      );
                    }, child: Text('Login')),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:12.0),
                    child: Text(msg, style: TextStyle(fontSize: 16, color: Colors.purple.shade300, fontWeight: FontWeight.w600),),
                  )
                ],
              )
          ),]
          ),
        ),
      ),



    );
  }
}