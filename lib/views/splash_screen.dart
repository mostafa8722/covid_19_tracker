
import 'package:covid_19_tracker/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(microseconds: 1000),(){
      Get.to(HomeScreen());
    });
    return Scaffold(
      body: Center(
        child: Column(
          children: [
              Text("Covid 19 Tracker"),
          ],
        ),
      ),
    );
  }
}