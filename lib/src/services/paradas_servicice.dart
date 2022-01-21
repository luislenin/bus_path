import 'package:bus_path/src/models/paradas_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ParadasServiceAPP{
    ParadasServiceAPP();
    final String _rootUrl = 'https://bussproject-89ea1.web.app/api/sitiosturisticos';

    Future<List<Paradas>> getParadas() async {
        List<Paradas> resultParadas = [];
        try{
            var url = Uri.parse(_rootUrl);
            final responseList = await http.get(url);

            List<dynamic> listParadas = json.decode(responseList.body);
             for (var item in listParadas){
        
            final paradas = Paradas.fromJson(item);
            resultParadas.add(paradas);
             }
        }catch(ex){
            //print (ex);
            return resultParadas;
        }

    return resultParadas;
    }

}