

import 'package:covid_19_tracker/controllers/home_controller.dart';
import 'package:covid_19_tracker/models/global_summary.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class GlobalViewLoaing extends StatelessWidget{





  @override
  Widget build(BuildContext context) {



        return
        Container(
          height: Get.height-190,
    child:
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child:  Column(

              children: [

                loadingCard(),
                loadingCard(),
                loadingCard(),
                loadingCard(),
                loadingLabel()

              ],
            ),
          )
          );


  }
  Widget loadingCard(){
    return Card(
elevation: 1,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5,vertical: 10),
        height: 100,
         child: Shimmer.fromColors(
      child: Column(
      children: [
        Container(
        height: 20,
        width: 100,
        color: Colors.white,
      ),
      Expanded(child: Container()),
        Container(
          height: 20,
          width: double.infinity,
          color: Colors.white,
        ),
        SizedBox(height: 5,),
        Container(
          height: 30,
          width: double.infinity,
          color: Colors.white,
        ),


      ],
    ),
    baseColor: Colors.grey.withOpacity(0.5),
    highlightColor: Colors.grey.withOpacity(0.3)),
      ),
    );
  }

  Widget loadingLabel(){
    return Card(
      elevation: 1,
      child: Container(
            padding: EdgeInsets.symmetric(horizontal: 5,vertical: 10),
        height: 30,
        child: Shimmer.fromColors(
            child: Column(
              children: [
                Container(
                  height: 20,
                  width: 200,
                  color: Colors.white,
                ),



              ],
            ),
            baseColor: Colors.grey.withOpacity(0.5),
            highlightColor: Colors.grey.withOpacity(0.3)),
      ),
    );
  }
}