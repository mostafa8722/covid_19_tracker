
import 'dart:convert';

class Country {

  String country;
  String slug;
  String ios2;

  Country(this.country,this.slug,this.ios2);

  factory Country.fromJson(Map<String , dynamic> json) => Country(json["country"],json["slug"] ,json["ios2"] );

}

List<Country> countryFromJson (String str) =>  List<Country>.from(json.decode(str).map((x)=>Country.fromJson(x)));