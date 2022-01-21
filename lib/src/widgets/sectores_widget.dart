import 'package:bus_path/src/models/country_model.dart';
import 'package:bus_path/src/services/sectores_service.dart';
import 'package:bus_path/src/widgets/card_country.dart';
import 'package:flutter/material.dart';


class CITIESWIDGET extends StatefulWidget {
  const CITIESWIDGET({Key? key}) : super(key: key);

  @override
  _CITIESWIDGETState createState() => _CITIESWIDGETState();
}

class _CITIESWIDGETState extends State<CITIESWIDGET> {
  
  final CITIESSERVICE _citiesservice = CITIESSERVICE();
  List <Country>? _listOfCountry;

  @override
  void initState() {
    super.initState();
    _downloadCountry();
  }

  @override
  Widget build(BuildContext context) {
    return _listOfCountry == null
        ? const Center(
            child: SizedBox(
                height: 50.0, width: 50.0, child: CircularProgressIndicator()))
        : _listOfCountry!.isEmpty
            ? const Center(
                child: SizedBox(
                    child: Text("No Hay Infomracion en los Sectores")))
            : Container(
                margin: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 14.0),
                
                    child: ListView(
                  children:  _listOfCountry!.map((e) => CARDCOUNTRY(model: e)).toList()));
  }
  _downloadCountry() async {

    _listOfCountry = await _citiesservice.getCities();
     if(mounted){
       setState(() {});
    }
   


  }
}