
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:working_calculator/calculator.dart';

class SplashScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return SplashScreenState();
  }
}
class SplashScreenState extends State<SplashScreen>{
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 1),(){
      Navigator.push(context, MaterialPageRoute(builder: (context) => DashBoardCalcy()));
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.black,
        child: Center(
          child: SizedBox(
              width: 200,
              height: 200,
              child: Image.asset("assets/images/calculator.png")
          ),
        ),
      ),
    );
  }
}