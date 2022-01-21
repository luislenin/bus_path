// To parse this JSON data, do
//
//     final country = countryFromJson(jsonString);

import 'dart:convert';

List<Country> countryFromJson(String str) => List<Country>.from(json.decode(str).map((x) => Country.fromJson(x)));

String countryToJson(List<Country> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Country {
    Country({
        this.country,
    });

    CountryClass? country;

    factory Country.fromJson(Map<String, dynamic> json) => Country(
        country: CountryClass.fromJson(json["country"]),
    );

    Map<String, dynamic> toJson() => {
        "country": country!.toJson(),
    };
}

class CountryClass {
    CountryClass({
        this.name,
        this.alpha2Code,
    });

    String? name;
    String? alpha2Code;

    factory CountryClass.fromJson(Map<String, dynamic> json) => CountryClass(
        name: json["name"],
        alpha2Code: json["alpha2_code"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "alpha2_code": alpha2Code,
    };
}
