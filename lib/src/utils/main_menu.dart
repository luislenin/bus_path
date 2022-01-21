import 'package:bus_path/src/widgets/sectores_widget.dart';
import 'package:bus_path/src/widgets/init_widget.dart';
import 'package:bus_path/src/widgets/parada_widget.dart';

import 'package:flutter/material.dart';

class ItemMenu{
  String title;
  IconData icon;
  ItemMenu(this.icon, this.title);

}

List<ItemMenu> menuOptions =[
 ItemMenu(Icons.home, "Pagina Inicial"),
 ItemMenu(Icons.map_outlined, "Sectores"),
 ItemMenu(Icons.bus_alert, "Paradas de Buses"),
];

List<Widget> contentWidgets = [
  const PaginaPrincipalWidget(),
  const CITIESWIDGET(),
  const ParadaWidget()
];