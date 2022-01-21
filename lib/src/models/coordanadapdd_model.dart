
import 'dart:convert';

import 'package:bus_path/src/models/geopointvalue_model.dart';
import 'package:bus_path/src/models/paradas_model.dart';

String paradasToJson(List<Paradas> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CoordenadaPdd {
    CoordenadaPdd({
        this.geoPointValue,
        this.valueType,
    });

    GeoPointValue? geoPointValue;
    String? valueType;

    factory CoordenadaPdd.fromJson(Map<String, dynamic> json) => CoordenadaPdd(
        geoPointValue: GeoPointValue.fromJson(json["geoPointValue"]),
        valueType: json["valueType"],
    );

    Map<String, dynamic> toJson() => {
        "geoPointValue": geoPointValue!.toJson(),
        "valueType": valueType,
    };
}
