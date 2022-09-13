
import 'package:covid_19_tracker/utils/constants.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        centerTitle: true,
        title: Text("COVID-19 Tracker Live Data"),
        elevation: 0,
      ),
      body: Column(),
    );
  }
}