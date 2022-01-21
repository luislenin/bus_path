import 'package:bus_path/src/models/paradas_model.dart';
import 'package:flutter/material.dart';

class ParadaCard extends StatelessWidget {
  const ParadaCard({Key? key, required this.model}) : super(key: key);
  final Paradas model;
  @override
  Widget build(BuildContext context) {
    final url = model.fieldsProto?.imagenUrlPdd!.stringValue.toString();
    return SizedBox(
        height: 600,
        child: Card(
          elevation: 7.0,
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(url.toString()), fit: BoxFit.fitWidth)),
            child: ListTile(
              title: Text(
                "Parada Actual: " +
                    model.fieldsProto!.nombrePdd!.stringValue.toString(),
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(color: Colors.blue),
              ),
              subtitle: Text(
                  "Anterior Parada: " +
                      model.fieldsProto!.nomAnteriorPdd!.stringValue.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .caption!
                      .copyWith(color: Colors.red)),
              trailing: Text(
                  "Siguiente\nParada: " +
                      model.fieldsProto!.nomSiguientePdd!.stringValue
                          .toString(),
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(color: Colors.green, fontSize: 12)),
            ),
          ),
        ));
  }
}
