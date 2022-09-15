
import 'dart:convert';

class GlobalSummary {

 int newConfirmed;
 int totalConfirmed;
 int newDeaths;
 int totalDeaths;
 int newRecovered;
 int totalRecovered;
 DateTime date;
 GlobalSummary(
 {
  required this.newConfirmed,
  required  this.totalConfirmed,
  required this.newDeaths,
  required this.totalDeaths,
  required  this.newRecovered,
  required this.totalRecovered,
  required this.date
}
     );
 factory GlobalSummary.fromJson(Map<String,dynamic> json) => GlobalSummary(



      newConfirmed:json["NewConfirmed"],
     totalConfirmed:json["TotalConfirmed"],
     newDeaths: json["NewDeaths"],
     totalDeaths:json["TotalDeaths"],
     newRecovered:json["NewRecovered"],
     totalRecovered:json["TotalRecovered"],
     date:DateTime.parse( json["Date"])

 );
}
List<GlobalSummary> globalSummaryFromJson (String str) =>  List<GlobalSummary>.from(json.decode(str)["Global"].map((x)=>GlobalSummary.fromJson(x)));
GlobalSummary summaryFromJson (String str) =>  GlobalSummary.fromJson(json.decode(str)["Global"] );
