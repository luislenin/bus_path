import 'package:bus_path/src/models/country_model.dart';
import 'package:flutter/material.dart';

class CARDCOUNTRY extends StatelessWidget {
  const CARDCOUNTRY({Key? key, required this.model}) : super(key: key);
  final Country model;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 12.0,
      child: ListTile(
        leading: const Icon(Icons.map_outlined),
        title: Text(model.country?.name ?? "",
            style: Theme.of(context).textTheme.headline4),
        subtitle: Text(model.country?.alpha2Code ?? "",
            style: Theme.of(context).textTheme.subtitle2),
        trailing: const Icon(Icons.maps_home_work),
      ),
    );
  }
}
