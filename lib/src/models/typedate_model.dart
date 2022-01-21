
import 'dart:convert';

import 'package:bus_path/src/models/paradas_model.dart';

String paradasToJson(List<Paradas> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


class Pdd {
    Pdd({
        this.stringValue,
        this.valueType,
    });

    String? stringValue;
    String? valueType;

    factory Pdd.fromJson(Map<String, dynamic> json) => Pdd(
        stringValue: json["stringValue"],
        valueType: json["valueType"],
    );

    Map<String, dynamic> toJson() => {
        "stringValue": stringValue,
        "valueType": valueType,
    };
}
