
class GlobalSummay {

 int newConfirmed;
 int totalConfirmed;
 int newDeaths;
 int totalDeaths;
 int newRecovered;
 int totalRecovered;
 DateTime date;
 GlobalSummay(
     this.newConfirmed,
     this.totalConfirmed,
     this.newDeaths,
     this.totalDeaths,
     this.newRecovered,
     this.totalRecovered,
     this.date
     );
 factory GlobalSummay.fromJson(Map<String,dynamic> json) => GlobalSummay(
      json["Global"]["newConfirmed"],
      json["Global"]["totalConfirmed"],
      json["Global"]["newDeaths"],
      json["Global"]["totalDeaths"],
      json["Global"]["newRecovered"],
      json["Global"]["totalRecovered"],
     DateTime.parse( json["date"]));
}