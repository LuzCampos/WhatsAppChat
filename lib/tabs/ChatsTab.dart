import 'package:flutter/material.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:whatsappmodel/pages/ChatScreen.dart';
import 'package:whatsappmodel/pages/Form.dart';

class ChatsTab extends StatefulWidget {
  @override
  _ChatsTabState createState() => _ChatsTabState();
}

class _ChatsTabState extends State<ChatsTab>  with AutomaticKeepAliveClientMixin<ChatsTab> {
  @override
  bool get wantKeepAlive => true;
  File imagenSeleccion;


  @override
  void initState() { 
    super.initState();
  }

  _abrirGaleria(BuildContext context) async {
    var foto = await ImagePicker.pickImage(source: ImageSource.gallery);
    this.setState(() {
      imagenSeleccion = foto;
    });
    Navigator.of(context).pop();
  }

  _abrirCamara(BuildContext context) async {
    var foto = await ImagePicker.pickImage(source: ImageSource.camera);
    this.setState(() {
      imagenSeleccion = foto;
    });
    Navigator.of(context).pop();
  }

  //lista de string's
  final List<List<String>> dataList = [
    <String>[
      'Rose',
      'Hola ¿Qué tal?',
      'https://66.media.tumblr.com/aba681576b3237660c096e6bfdeb0792/tumblr_phb9sihk4O1vfxqt7_540.png'
    ],
    <String>[
      'Sully',
      '¿Cómo estas?',
      'https://66.media.tumblr.com/3c871309784ce5271d8d644736c246cb/tumblr_pn6ld6ouKu1twwtodo6_250.png'
    ],
  ];

  Future<void> _mostrarEleccionDialogo(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text('Elige una opción'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    GestureDetector(
                      child: Text('Gallery'),
                      onTap: () {
                        _abrirGaleria(context);
                      },
                    ),
                    Padding(padding: EdgeInsets.all(8.0)),
                    GestureDetector(
                      child: Text('Camera'),
                      onTap: () {
                        _abrirCamara(context);
                      },
                    )
                  ],
                ),
              ));
        });
  }

 
  // retorna un scaffold
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        body: ListView(
      children: ListTile.divideTiles(
        context: context,
        tiles: dataList.map(
          (list) {
            return ListTile(
                leading: GestureDetector(
                  child: imagenSeleccion == null
                  ? CircleAvatar(
                          radius: 25.0,
                          backgroundImage: NetworkImage(list.elementAt(2)),
                        )
                  : CircleAvatar(
                    backgroundImage: FileImage(imagenSeleccion),
                  ),      
                  onTap: () {
                    _mostrarEleccionDialogo(context);
                  },
                ),
                title: Text(list.elementAt(0)),
                //title: Text(list.join(', ')),
                subtitle: Text(list.elementAt(1)),
                //subtitle: Text(list.sublist(1,2).toString()),
                onLongPress: () async {
                  final editData = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Formulario(data: list),
                      fullscreenDialog: true,
                    ),
                  );

                  if (editData != null) {
                    final index = dataList.indexOf(list);

                    if (index != -1) {
                      setState(() {
                        dataList[index] = editData;
                      });
                    }
                  }
                },
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChatScreen(data: list),
                          fullscreenDialog: true));
                });
          },
        ),
      ).toList(),
    ),
    floatingActionButton: FloatingActionButton(         
            child: Icon(Icons.add),
            backgroundColor: Color(0xFF25D366),
            onPressed: () async {
            final newData = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Formulario(),
                fullscreenDialog: true,
              ),
            );

            if (newData != null) {
              setState(() {
                dataList.add(newData);
              });
            }
          }),
    );
  }
}
