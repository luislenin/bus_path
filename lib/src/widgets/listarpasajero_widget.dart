import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ListarPasajero extends StatefulWidget {
  const ListarPasajero({Key? key, required this.pasajeroActual})
      : super(key: key);

  final CollectionReference pasajeroActual;
  @override
  State<ListarPasajero> createState() => _ListarPasajeroState();
}

class _ListarPasajeroState extends State<ListarPasajero> {
  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(centerTitle: true, title: const Text("Lista de Pasajeros")),
      body: Container(
        margin: EdgeInsets.fromWindowPadding(WindowPadding.zero, 5),
        child: SingleChildScrollView(
          child: StreamBuilder(
            stream: widget.pasajeroActual.orderBy("nombre").snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: Text("Loading"),
                );
              }
              return Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                    children: snapshot.data!.docs.map((pasajeros) {
                  return Card(
                    child: ListTile(
                      leading: 
                       
                         Image(
                          image: NetworkImage(pasajeros["URLimg_usr"].toString()),
                          fit: BoxFit.contain,
                        ),
                    
                      title: Text(pasajeros['nombre']),
                      subtitle: Text(pasajeros["direccion"]),
                      trailing: Text(pasajeros["edad"]),
                    ),
                  );
                }).toList()),
              );
            },
          ),
        ),
      ),
    );
  }
}
