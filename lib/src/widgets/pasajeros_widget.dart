import 'package:bus_path/src/pages/home_page.dart';
import 'package:bus_path/src/services/img_service.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';

class PasajerosRegistro extends StatefulWidget {
  const PasajerosRegistro({Key? key}) : super(key: key);

  @override
  _PasajerosRegistroState createState() => _PasajerosRegistroState();
}

class _PasajerosRegistroState extends State<PasajerosRegistro> {
  File? _imagen;
  String? _urlimagen;

  final correo = TextEditingController();
  final contra = TextEditingController();
  final nombre = TextEditingController();
  final edad = TextEditingController();
  final direccion = TextEditingController();
  final FotosService _fotosService = FotosService();




  Future _selectImage(ImageSource source) async {
    final imageCamera = await ImagePicker().pickImage(source: source);
    if (imageCamera == null) return;
    final imageTemporary = File(imageCamera.path);
    _imagen = imageTemporary;
    if (_imagen != null) {
      _urlimagen = await _fotosService.uploadImage(_imagen!);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(centerTitle: true, title: const Text("Registro de Pasajeros"),),
        body: Card(
          
          child: Column(
            children: [
              
              pasajero(),
              
              Row(
               mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MaterialButton(
                    child: const Text("Aceptar"),
                    onPressed: () async {
                      await _enviaralservidor();
                      showDialog(context: context, 
                      builder: (BuildContext context){
                          return AlertDialog(
                            title: const Text("Pasajero Añadido", textAlign: TextAlign.center,),
                            content: SingleChildScrollView(
                              child: ListBody(children: const [
                                Text("Completado", textAlign: TextAlign.center,),
                              ],),
                            ),
                            actions: [TextButton(
                              child: const Text("Aceptar", textAlign: TextAlign.center,),
                              onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()),
                              );
                            }),
                            ],
                          );
                      });
                    }
                    
                    ),
                     MaterialButton(
                    child: const Text("Cancelar"),
                    onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()),
                              );
                    }
                  ),
                ],
              )
            ],
            
          ),
        )
      
    );
}

  Widget pasajero() {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 15,
        child: Padding(
          padding: const EdgeInsets.all(11),
          child: Column(children: <Widget>[
            TextFormField(
              controller: nombre,
              decoration: const InputDecoration(
                  labelText: "Nombre del Pasajero", prefixIcon: Icon(Icons.person_add)),
            ),
            TextFormField(
              controller: contra,
              decoration: const InputDecoration(
                  labelText: "Contraseña", prefixIcon: Icon(Icons.password_sharp)),
            ),
            TextFormField(
              controller: correo,
              decoration: const InputDecoration(
                  labelText: "Correo", prefixIcon: Icon(Icons.email_sharp)),
            ),
            TextFormField(
              controller: edad,
              decoration: const InputDecoration(
                  labelText: "Edad", prefixIcon: Icon(Icons.adb_sharp)),
            ),
            TextFormField(
              controller: direccion,
              decoration: const InputDecoration(
                  labelText: "Direccion", prefixIcon: Icon(Icons.directions)),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MaterialButton(
                      color: Colors.black,
                      child: const Icon(Icons.camera, color: Colors.white,), 
                      onPressed: () => _selectImage(ImageSource.camera)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MaterialButton(
                      color: Colors.black,
                      child: const Icon(Icons.image, color: Colors.white,), 
                      onPressed: () => _selectImage(ImageSource.gallery)),
                  ),
                ],
              ),
            ),
          ]),
        ));
  }

  Future<void> _enviaralservidor() async {
    FirebaseFirestore.instance.runTransaction((Transaction transaction) async {
      CollectionReference reference =
          FirebaseFirestore.instance.collection('usuarios');
      await reference.add({
        "nombre": nombre.text,
        "correo": correo.text,
        "contraseña": contra.text,
        "edad": edad.text,
        "direccion": direccion.text,
        "URLimg_usr": _urlimagen,
      });
    });
  }

}
