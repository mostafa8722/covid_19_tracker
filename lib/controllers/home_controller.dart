

import 'package:covid_19_tracker/models/country.dart';
import 'package:covid_19_tracker/models/country_summary.dart';
import 'package:covid_19_tracker/models/global_summary.dart';
import 'package:covid_19_tracker/services/remote_service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{
  var navigationStatus = NavigationStatus.GLOBAL.obs;
  var isLoading = false.obs;
  var globalSummaries = <GlobalSummary>[].obs;
  var countries = <Country>[].obs;
  var countrySummaries = <CountrySummary>[].obs;



 void changeStatus (value){

   print(value.toString());
    if(value==1)
      navigationStatus.value = NavigationStatus.GLOBAL;
    else if(value==2)
      navigationStatus.value = NavigationStatus.COUNTRY;
  }

  fetchSummary() async{

    try{
      isLoading(true);

      var globalSums  =await RemoteService.fetchGlobalSummary()  ;



      if(globalSums !=null)
        globalSummaries.value =  [globalSums] as List<GlobalSummary> ;




    }catch(e){

    }finally{
      Future.delayed(Duration(microseconds: 1000),(){
        isLoading(false);
      });

    }

  }

  fetchCountry() async{

    try{
      isLoading(true);

      var globalSums  =await RemoteService.fetchCountries()  ;



      if(globalSums !=null)
        countries.value =  globalSums as List<Country> ;



    }catch(e){

    }finally{
      Future.delayed(Duration(microseconds: 1000),(){
        isLoading(false);
      });

    }

  }

  fetchSummaryCountry(String str) async{

    try{
      isLoading(true);

      var globalSums  =await RemoteService.fetchCountrySummary(str)  ;



      if(globalSums !=null)
        countrySummaries.value =  globalSums as List<CountrySummary> ;


      print("countrySummaries");
      print(countrySummaries);


    }catch(e){

    }finally{
      Future.delayed(Duration(microseconds: 1000),(){
        isLoading(false);
      });

    }

  }



}

enum NavigationStatus {
  GLOBAL,COUNTRY
}