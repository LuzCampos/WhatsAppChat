import 'package:flutter/material.dart';
import 'package:whatsappmodel/tabs/CamaraTab.dart';
import 'package:whatsappmodel/tabs/ChatsTab.dart';
import 'package:whatsappmodel/tabs/EstadosTab.dart';
import 'package:whatsappmodel/tabs/LlamadasTab.dart';

void main() => runApp(App());

class App extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ) ;
  }
}

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 1,
          child: Scaffold
      (appBar:  AppBar(
        title: Text('Whatsapp',
        style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
        backgroundColor: Color(0xFF075E54),
        bottom: TabBar(
          indicatorColor: Colors.white,
          tabs: <Widget>[

            Tab(
              icon: Icon(Icons.camera_alt),
            ),

            Tab(child: Text('CHATS'),),

             Tab(
              child: Text('STATUS'),
            ),

            Tab(
              child: Text('CALLS'),
            ),



          ] 
        ),
        actions: <Widget>[
          
          IconButton(
          icon: Icon(Icons.search),
          onPressed: (){}),

          IconButton(
          icon: Icon(Icons.more_vert),
          onPressed: (){}),

        ],
      ),
      body: TabBarView(
        children: <Widget>[
          CamaraTab(),
          ChatsTab(),
          EstadosTab(),
          LlamadasTab()
        ]
      ),
      /*floatingActionButton: FloatingActionButton(
        child: Icon(Icons.chat),
        onPressed: (){},
        backgroundColor: Color(0xFF25D366),
        ),*/
      ),
    );
  }
}