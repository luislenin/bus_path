

import 'dart:convert';

import 'package:bus_path/src/models/prototipocampos_model.dart';

List<Paradas> paradasFromJson(String str) => List<Paradas>.from(json.decode(str).map((x) => Paradas.fromJson(x)));


class Paradas {
    Paradas({
        this.fieldsProto,
    });

    FieldsProto? fieldsProto;

    factory Paradas.fromJson(Map<String, dynamic> json) => Paradas(
        fieldsProto: FieldsProto.fromJson(json["_fieldsProto"]),
    );

    Map<String, dynamic> toJson() => {
        "_fieldsProto": fieldsProto!.toJson(),
    };
}

