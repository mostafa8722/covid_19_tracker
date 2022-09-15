

import 'dart:convert';

class CountrySummary {

  String country;
  int confirmed;
  int death;
   int recovered;
  int active;
  DateTime date;

  CountrySummary({
    required this.country,
    required this.confirmed,
    required this.death,
   required this.recovered,
    required this.active,
    required this.date
  });

  factory CountrySummary.fromJson(Map<String, dynamic> json) =>
      CountrySummary(
          country: json["Country"],
         confirmed: json["Confirmed"],
          death:json["Deaths"],
          recovered:json["Recovered"],
          active: json["Active"],
          date:DateTime.parse(json["Date"])

          );

}

List<CountrySummary> countrySummaryFromJson (String str) =>  List<CountrySummary>.from(json.decode(str).map((x)=>CountrySummary.fromJson(x)));