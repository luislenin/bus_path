
import 'dart:convert';

import 'package:bus_path/src/models/paradas_model.dart';

String paradasToJson(List<Paradas> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


class GeoPointValue {
    GeoPointValue({
        this.latitude,
        this.longitude,
    });

    int? latitude;
    int? longitude;

    factory GeoPointValue.fromJson(Map<String, dynamic> json) => GeoPointValue(
        latitude: json["latitude"],
        longitude: json["longitude"],
    );

    Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
    };
}

