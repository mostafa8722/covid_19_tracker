
import 'dart:convert';

class Country {

  String country;
  String slug;
  String ios2;

  Country({
     required this.country,
    required this.slug,
    required this.ios2
});

  factory Country.fromJson(Map<String , dynamic> json) => Country(


      country:json["Country"],
      slug:json["Slug"] ,
      ios2:json["ISO2"] );

}

List<Country> countryFromJson (String str) =>  List<Country>.from(json.decode(str).map((x)=>Country.fromJson(x)));