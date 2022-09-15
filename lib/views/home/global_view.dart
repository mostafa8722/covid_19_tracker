

import 'package:covid_19_tracker/controllers/home_controller.dart';
import 'package:covid_19_tracker/models/global_summary.dart';
import 'package:covid_19_tracker/utils/constants.dart';
import 'package:covid_19_tracker/views/home/global_view_loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_formatter/money_formatter.dart';
import 'package:timeago/timeago.dart' as timeago;
class GlobalView extends StatelessWidget{


  HomeController controller =  Get.find();


  @override
  Widget build(BuildContext context) {

    return
      Obx((){
        return Column(
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Global Corona Virus Cases ",
                  style: TextStyle(fontWeight:FontWeight.bold,color: Colors.white,fontSize: 15),),
                GestureDetector(
                  onTap: (){
                    controller.fetchSummary();
                  },
                  child: Icon(Icons.refresh_outlined,color: Colors.white,size: 15),
                )
              ],
            ),

            controller.isLoading == true ?
            GlobalViewLoaing()
                :GlobalViewContent()
          ],
        );
      });
  }
  Widget GlobalViewContent(){
    var summary = controller.globalSummaries[0];
    return
    Container(
      height: Get.height-190,
      child:   SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child:
        Column(
          children: [
            buildCard("CONFIRMED", summary.totalConfirmed,
                summary.newConfirmed,kConfirmedColor),
            buildCard( "ACTIVE",
                summary.totalConfirmed - summary.totalRecovered - summary.totalDeaths,
                summary.newConfirmed - summary.newRecovered - summary.newDeaths,
                kActiveColor),
            buildCard(  "RECOVERED",
                summary.totalRecovered,
                summary.newRecovered,
                kRecoveredColor),
            buildCard(    "DEATH",
                summary.totalDeaths,
                summary.newDeaths,
                kDeathColor),
            Padding(padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
              child: Text("Statistics updated at : ${timeago.format(summary.date)}"),
            )
          ],
        ),
      ),
    );

  }
  Widget buildCard(String title,int label1,int label2,Color color){
    return
      Card(
        elevation: 1,
        child: Container(
          height: 100,
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          margin: EdgeInsets.only(bottom: 10),
          child:Column(
            children: [

              Center(child: Text(title,style: TextStyle(color: Colors.grey,fontSize: 14),),),
              Expanded(child: Container()),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("total",style: TextStyle(color: color,fontSize: 14),),
                  Text("today",style: TextStyle(color: color,fontSize: 14),),

                ],
              ),
              SizedBox(height: 6,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(MoneyFormatter(
                      amount: label1.toDouble()
                  ).output.withoutFractionDigits.toString(),style: TextStyle(color: color,fontSize: 20,  fontWeight: FontWeight.bold,),),
                  Text(MoneyFormatter(
                      amount: label2.toDouble()
                  ).output.withoutFractionDigits.toString(),style: TextStyle(color: color,fontSize: 20,  fontWeight: FontWeight.bold,),),
                ],
              ),


            ],
          ) ,
        ),
      );
  }
}