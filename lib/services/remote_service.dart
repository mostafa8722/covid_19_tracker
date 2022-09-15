
import 'dart:convert';

import 'package:covid_19_tracker/models/country.dart';
import 'package:covid_19_tracker/models/country_summary.dart';
import 'package:covid_19_tracker/models/global_summary.dart';
import 'package:http/http.dart' as http;
class RemoteService {
  static var client = http.Client();
  static Future<GlobalSummary>  fetchGlobalSummary() async{

    var response = await client.get(Uri.parse(
        'https://api.covid19api.com/summary'));


    if (response.statusCode == 200) {
      var jsonString = response.body;


      return summaryFromJson(jsonString);
    } else {
      var jsonString = response.body;
      return summaryFromJson(jsonString);
    }

  }

  static Future<List<Country>>  fetchCountries() async{

    var response = await client.get(Uri.parse(
        'https://api.covid19api.com/countries'));


    if (response.statusCode == 200) {
      var jsonString = response.body;


      return countryFromJson(jsonString);
    } else {
      var jsonString = response.body;
      return countryFromJson(jsonString);
    }

  }

  static Future<List<CountrySummary>>  fetchCountrySummary(String str) async{

    var response = await client.get(Uri.parse(
        'https://api.covid19api.com/total/dayone/country/${str}'));


    if (response.statusCode == 200) {
      var jsonString = response.body;



      return countrySummaryFromJson(jsonString);
    } else {
      var jsonString = response.body;
      return countrySummaryFromJson(jsonString);
    }

  }
}