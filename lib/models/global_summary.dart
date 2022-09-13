
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
     this.newConfirmed,
     this.totalConfirmed,
     this.newDeaths,
     this.totalDeaths,
     this.newRecovered,
     this.totalRecovered,
     this.date
     );
 factory GlobalSummary.fromJson(Map<String,dynamic> json) => GlobalSummary(
      json["newConfirmed"],
      json["totalConfirmed"],
      json["newDeaths"],
      json["totalDeaths"],
      json["newRecovered"],
      json["totalRecovered"],
     DateTime.parse( json["date"]));
}
List<GlobalSummary> globalSummaryFromJson (String str) =>  List<GlobalSummary>.from(json.decode(str)["Global"].map((x)=>GlobalSummary.fromJson(x)));