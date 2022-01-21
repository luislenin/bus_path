import 'dart:convert';

import 'package:bus_path/src/models/country_model.dart';

import 'package:http/http.dart' as http;

class CITIESSERVICE {
  CITIESSERVICE();
  final String _rootUrl = 'https://flixbus.p.rapidapi.com/v1/cities';

  Future<List<Country>> getCities() async {
    List<Country> resultCities = [];
      try{
          var url = Uri.parse(_rootUrl);
          var headers = {
        'x-rapidapi-host': 'flixbus.p.rapidapi.com',
        'x-rapidapi-key': '818b80405emsh3523217de6a50cep1e50f7jsn4cb4544f681f'
      };
      final responseList = await http.get(url, headers: headers);
      if (responseList.body.isEmpty)  return resultCities;

      List<dynamic> listOfCountry = json.decode(responseList.body);
      
      for (var item in listOfCountry) {
      final countrytoadd = Country.fromJson(item);
      resultCities.add(countrytoadd);
      }
      
      }catch(ex){
        //print (ex);
        return resultCities;
      }

    return resultCities;
  }
}