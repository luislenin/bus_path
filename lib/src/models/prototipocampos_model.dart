
import 'dart:convert';

import 'package:bus_path/src/models/coordanadapdd_model.dart';
import 'package:bus_path/src/models/paradas_model.dart';
import 'package:bus_path/src/models/typedate_model.dart';

String paradasToJson(List<Paradas> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FieldsProto {
    FieldsProto({
        this.nombrePdd,
        this.direccion1Pdd,
        this.terminalPdd,
        this.nomAnteriorPdd,
        this.nomSiguientePdd,
        this.direccion2Pdd,
        this.imagenUrlPdd,
        this.coordenadaPdd,
    });

    Pdd? nombrePdd;
    Pdd? direccion1Pdd;
    Pdd? terminalPdd;
    Pdd? nomAnteriorPdd;
    Pdd? nomSiguientePdd;
    Pdd? direccion2Pdd;
    Pdd? imagenUrlPdd;
    CoordenadaPdd? coordenadaPdd;

    factory FieldsProto.fromJson(Map<String, dynamic> json) => FieldsProto(
        nombrePdd: Pdd.fromJson(json["nombre_pdd"]),
        direccion1Pdd: Pdd.fromJson(json["direccion_1_pdd"]),
        terminalPdd: Pdd.fromJson(json["terminal_pdd"]),
        nomAnteriorPdd: Pdd.fromJson(json["nomAnterior_pdd"]),
        nomSiguientePdd: Pdd.fromJson(json["nomSiguiente_pdd"]),
        direccion2Pdd: Pdd.fromJson(json["direccion _2_pdd"]),
        imagenUrlPdd: Pdd.fromJson(json["imagen_url_pdd"]),
        coordenadaPdd: CoordenadaPdd.fromJson(json["coordenada_pdd"]),
    );

    Map<String, dynamic> toJson() => {
        "nombre_pdd": nombrePdd!.toJson(),
        "direccion_1_pdd": direccion1Pdd!.toJson(),
        "terminal_pdd": terminalPdd!.toJson(),
        "nomAnterior_pdd": nomAnteriorPdd!.toJson(),
        "nomSiguiente_pdd": nomSiguientePdd!.toJson(),
        "direccion _2_pdd": direccion2Pdd!.toJson(),
        "imagen_url_pdd": imagenUrlPdd!.toJson(),
        "coordenada_pdd": coordenadaPdd!.toJson(),
    };
}

