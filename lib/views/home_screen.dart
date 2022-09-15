
import 'package:covid_19_tracker/controllers/home_controller.dart';
import 'package:covid_19_tracker/utils/constants.dart';
import 'package:covid_19_tracker/views/home/country_view.dart';
import 'package:covid_19_tracker/views/home/global_view.dart';
import 'package:covid_19_tracker/views/home/navigation_option.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class HomeScreen extends StatelessWidget{


   HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
controller.fetchSummary();
controller.fetchCountry();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        centerTitle: true,
        title: Text("COVID-19 Tracker Live Data",style: TextStyle(color: Colors.white),),
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
              child:
          Container(
            height: 200,
            padding: EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              )
            ),
            child: Obx((){
              return

              AnimatedSwitcher(
                  child:   controller.navigationStatus ==NavigationStatus.GLOBAL ? GlobalView(): CountryView(),
                  duration: Duration(microseconds: 250));
            }),

          )
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            height: 50,
            child:
    Obx((){

      return  Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [


          NavigationOption(title: "Global ", isSelected: controller.navigationStatus ==NavigationStatus.GLOBAL?true:false, onSelected:()=> controller.changeStatus(1)),
          NavigationOption(title: "Country", isSelected: controller.navigationStatus ==NavigationStatus.COUNTRY?true:false, onSelected:(){
      controller.fetchSummaryCountry("united-states");
      controller.changeStatus(2);
      }

              ),

        ],
      );
    })

          )
        ],
      ),
    );
  }
}