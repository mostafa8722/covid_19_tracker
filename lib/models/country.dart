
class Country {

  String country;
  String slug;
  String ios2;

  Country(this.country,this.slug,this.ios2);

  factory Country.fromJson(Map<String , dynamic> json) => Country(json["country"],json["slug"] ,json["ios2"] );

}