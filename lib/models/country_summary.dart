

class CountrySummary {

  String country;
  int confirmed;
  int death;
  int recoverd;
  int active;
  DateTime date;

  CountrySummary(this.country,this.confirmed,this.death,this.recoverd,this.active,this.date);

  factory CountrySummary.fromJson(Map<String, dynamic> json) =>
      CountrySummary(json["country"], json["confirmed"], json["death"], json["recoverd"], json["active"], DateTime.parse(json["date"]));
}