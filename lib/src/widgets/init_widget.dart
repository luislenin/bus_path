import 'package:bus_path/src/widgets/listarpasajero_widget.dart';
import 'package:bus_path/src/widgets/pasajeros_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PaginaPrincipalWidget extends StatelessWidget {
const PaginaPrincipalWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     CollectionReference pasajeros =
        FirebaseFirestore.instance.collection('usuarios');
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 200,
          width: 200,
          child: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage("https://res.cloudinary.com/buspath/image/upload/v1642726389/BUSPATH_lu2xmg.jpg"), fit: BoxFit.cover)),
          ),
        ),
        Text("Pagina Principal", style: Theme.of(context).textTheme.headline4),
         MaterialButton(
                  child:  Text("Registar Pasajeros",
                    style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(color: Colors.white)),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                               const PasajerosRegistro()));
                  },
                  color: Colors.amber,
                ),
        MaterialButton(
                  child:  Text("Listar Pasajeros",
                    style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(color: Colors.white)),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                               ListarPasajero(pasajeroActual: pasajeros, )));
                  },
                  color: Colors.amber,
                )
      ],

    ));
  }
}