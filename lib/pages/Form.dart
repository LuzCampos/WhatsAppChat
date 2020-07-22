import 'package:flutter/material.dart';

class Formulario extends StatefulWidget {
  // objeto data creado para paso de párametros
  final List<String> data;

  //instancia en el constructor
  Formulario({List<String> data}) : data = data ?? <String>[];

  @override
  _FormularioState createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  //lista de controladores en los textfield's
  List<TextEditingController> controllers;

  @override
  void initState() {
    super.initState();

    setState(() {
      if (widget.data.isNotEmpty) {
        controllers = widget.data.map((s) {
          return TextEditingController(text: s);
        }).toList();
      } else {
        controllers = [];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF075E54),
        title: Text('Editar, agregar 3'), actions: [
        IconButton(
          icon: Icon(Icons.save),
          onPressed: () {
            if (controllers.isEmpty) {
              print('Data is empty, cannot saved');
              return;
            }

            final list = controllers.map((c) => c.text).toList();
            Navigator.pop(context, list);
          },
        ),
      ]
      ),
      body: controllers == null
          ? CircularProgressIndicator()
          : ListView(
              children: controllers.map((controller) {
                return Container(
                  padding: const EdgeInsets.all(16),
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(
                        labelText:
                            'Type data index-${controllers.indexOf(controller) + 1}'),
                  ),
                );
              }).toList(),
            ),
      floatingActionButton: Row(mainAxisSize: MainAxisSize.min, children: [
        FloatingActionButton(
          heroTag: 'min',
          onPressed: () {
            setState(() {
              controllers.removeLast();
            });
          },
          child: Icon(Icons.remove),
          backgroundColor: Color(0xFF25D366),
        ),
        SizedBox(width: 8),
        FloatingActionButton(
          heroTag: 'add',
          onPressed: () {
            setState(() {
              controllers.add(TextEditingController());
            });
          },
          child: Icon(Icons.add),
          backgroundColor: Color(0xFF25D366),
        )
      ]),
    );
  }
}