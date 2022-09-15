

import 'package:covid_19_tracker/controllers/home_controller.dart';
import 'package:covid_19_tracker/models/country.dart';
import 'package:covid_19_tracker/models/country_summary.dart';
import 'package:covid_19_tracker/models/time_series_case.dart';

import 'package:covid_19_tracker/utils/constants.dart';
import 'package:covid_19_tracker/views/home/chart.dart';
import 'package:covid_19_tracker/views/home/country_view_loading.dart';
import 'package:covid_19_tracker/views/home/global_view_loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import 'package:get/get.dart';
import 'package:money_formatter/money_formatter.dart';

import 'package:charts_flutter/flutter.dart' as charts;


class CountryView extends StatelessWidget{


  HomeController controller =  Get.find();
  TextEditingController _typeAheadController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return
      Obx((){
        return Column(
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Type the country name ",
                  style: TextStyle(fontWeight:FontWeight.bold,color: Colors.white,fontSize: 15),),
               
              ],
            ),

            SizedBox(height: 5,),
            TypeAheadField(
                textFieldConfiguration: TextFieldConfiguration(
                  controller: _typeAheadController,
                  decoration: InputDecoration(
                    hintText: "Type here country name",
                    hintStyle: TextStyle(fontSize: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                     borderSide: BorderSide(
                       width: 0,
                       style: BorderStyle.none
                     )
                    ),
                    filled: true,
                    fillColor: Colors.grey.withOpacity(0.6),
                    contentPadding: EdgeInsets.all(10),
                    prefixIcon:Padding(
                      padding: EdgeInsets.all(10),
                      child: Icon(Icons.search,size: 29,color: Colors.black.withOpacity(0.7),),
                    )
                  ),

                ),

                suggestionsCallback: (pattern){
             
                  return _getSuggestion(controller.countries,pattern);
                },
                itemBuilder: (context,suggestion){
                  return ListTile(
                    title: Text(suggestion.toString(),style: TextStyle(color: Colors.orange),),
                  );
                },
        transitionBuilder: (context,suggestionBox,controller){
        return suggestionBox;
        },onSuggestionSelected: (suggestion){


                  print(suggestion);
                  this._typeAheadController.text = suggestion.toString();
                  controller.fetchSummaryCountry(suggestion.toString());
            }),

            controller.isLoading == true ?
            CountryViewLoaing()
                :CountryViewContent(),



          ],
        );
      });
  }
  Widget CountryViewContent(){
    var summaries = controller.countrySummaries;
    return
      Container(
        height: Get.height-250,
        child:   SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child:
          Column(
            children: [

             buildCard(  "CONFIRMED",
                "ACTIVE",
                summaries[summaries.length - 1].confirmed,
                summaries[summaries.length - 1].active,
                kConfirmedColor,
                kActiveColor,),
              buildCard(  "RECOVERED",
                "DEATH",
                summaries[summaries.length - 1].recovered,
                summaries[summaries.length - 1].death,
                kRecoveredColor,
                kDeathColor,),

              buildChartCard(  "RECOVERED",
                "DEATH",
                summaries[summaries.length - 1].recovered,
                summaries[summaries.length - 1].death,
                kRecoveredColor,
                kDeathColor,),



            ],
          ),
        ),
      );

  }
  Widget buildCard(String title1,String title2,int label1,int label2,Color color1,Color color2){
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


              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(title1,style: TextStyle(color: Colors.grey,fontSize: 20),),
                  Text(title2,style: TextStyle(color: Colors.grey,fontSize: 20),),

                ],
              ),
              Expanded(child: Container()),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("total",style: TextStyle(color: color1,fontSize: 14),),
                  Text("today",style: TextStyle(color: color2,fontSize: 14),),

                ],
              ),
              SizedBox(height: 6,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(MoneyFormatter(
                      amount: label1.toDouble()
                  ).output.withoutFractionDigits.toString(),style: TextStyle(color: color1,fontSize: 20,  fontWeight: FontWeight.bold,),),
                  Text(MoneyFormatter(
                      amount: label2.toDouble()
                  ).output.withoutFractionDigits.toString(),style: TextStyle(color: color2,fontSize: 20,  fontWeight: FontWeight.bold,),),
                ],
              ),


            ],
          ) ,
        ),
      );
  }

  List<String> _getSuggestion(List<Country> countries,String query){

    List<String> matches = [];
    for (var item in countries){
      matches.add(item.country);
    }

    matches.retainWhere((e) => e.toLowerCase().contains(query.toLowerCase()));
    return matches;




  }

  Widget buildChartCard(String title1,String title2,int label1,int label2,Color color1,Color color2){
    return
      Card(
        elevation: 1,
        child: Container(
          height: 190,
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          margin: EdgeInsets.only(bottom: 10),
          child:
          Chart(
            _createData(controller.countrySummaries),
            false
          )
        ),
      );
  }
  List<charts.Series<TimeSeriesCase,DateTime>> _createData(List<CountrySummary> summs){
    List<TimeSeriesCase>  confirmedData=[];
    List<TimeSeriesCase>  activeData=[];
    List<TimeSeriesCase>  recoveredData=[];
    List<TimeSeriesCase>  deathData=[];

    for (var item in summs) {
      confirmedData.add(TimeSeriesCase(item.date, item.confirmed));
      activeData.add(TimeSeriesCase(item.date, item.active));
      recoveredData.add(TimeSeriesCase(item.date, item.recovered));
      deathData.add(TimeSeriesCase(item.date, item.death));
    }
    return [
      new charts.Series<TimeSeriesCase,DateTime>
        (id: "Confirmed",
          colorFn: (_, __) => charts.ColorUtil.fromDartColor(kConfirmedColor),
          data: confirmedData,
        domainFn: (TimeSeriesCase cases, _) => cases.time,
        measureFn: (TimeSeriesCase cases, _) => cases.cases,),
      new charts.Series<TimeSeriesCase, DateTime>(
        id: 'Active',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(kActiveColor),
        domainFn: (TimeSeriesCase cases, _) => cases.time,
        measureFn: (TimeSeriesCase cases, _) => cases.cases,
        data: activeData,
      ),
      new charts.Series<TimeSeriesCase, DateTime>(
        id: 'Recovered',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(kRecoveredColor),
        domainFn: (TimeSeriesCase cases, _) => cases.time,
        measureFn: (TimeSeriesCase cases, _) => cases.cases,
        data: recoveredData,
      ),
      new charts.Series<TimeSeriesCase, DateTime>(
        id: 'Death',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(kDeathColor),
        domainFn: (TimeSeriesCase cases, _) => cases.time,
        measureFn: (TimeSeriesCase cases, _) => cases.cases,
        data: deathData,
      ),
    ];

}
}