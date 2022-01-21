// ignore_for_file: camel_case_types, file_names

import 'package:bus_path/src/models/paradas_model.dart';
import 'package:bus_path/src/services/paradas_servicice.dart';
import 'package:bus_path/src/widgets/card_parada.dart';
import 'package:flutter/material.dart';

class ParadaWidget extends StatefulWidget {
  const ParadaWidget({Key? key}) : super(key: key);

  @override
  _ParadaWidgetState createState() => _ParadaWidgetState();
}

class _ParadaWidgetState extends State<ParadaWidget> {
  final ParadasServiceAPP _paradasservice =  ParadasServiceAPP();
  List <Paradas>? _listparadas;
  @override
   void initState() {
    super.initState();
    _downloadParada();
  }


  @override
  Widget build(BuildContext context) {
    return  _listparadas == null
        ? const Center(
            child: SizedBox(
                height: 50.0, width: 50.0, child: CircularProgressIndicator()))
        : _listparadas!.isEmpty
            ? const Center(
                child: SizedBox(
                    child: Text("No Hay Información en las paradas")))
            : Container(
                margin: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 14.0),
                
                    child: ListView(
                  children:   _listparadas!.map((e) => ParadaCard(model: e)).toList()));
  }

  _downloadParada() async {

    _listparadas = await _paradasservice.getParadas();
    if(mounted){
       setState(() {});
    }
   


  }

}