import 'package:flutter/material.dart';
import 'package:whatsappmodel/models/ChatMensaje.dart';

//import 'package:whatsappmodel/tabs/ChatsTab.dart';

class ChatScreen extends StatelessWidget {

  final List<String> data;

  ChatScreen({List<String> data}) : data = data ?? <String>[];

  final List<ChatMensaje> mensajes = [
    ChatMensaje(
      date: "9:10 a. m.",
      enviadoPorMi: true,
      mensaje: "Hola xd",
      imagen: Image.network(
        'https://66.media.tumblr.com/12ae41104d5f48ccb8e6688d843f4114/26ae48d8c498e9b4-a1/s400x600/b6c9dc9399d794cd128ceeb60b9c75e3d473f595.png',
        fit: BoxFit.fitWidth,
        height: 200,
      ),
      envioImagen: true,
    ),
    ChatMensaje(
      date: "9:11 a. m.",
      enviadoPorMi: true,
      mensaje: "Que tal?",
      imagen: Image.network(
        'https://66.media.tumblr.com/12ae41104d5f48ccb8e6688d843f4114/26ae48d8c498e9b4-a1/s400x600/b6c9dc9399d794cd128ceeb60b9c75e3d473f595.png',
        fit: BoxFit.fitWidth,
      ),
      envioImagen: false,
    ),
    ChatMensaje(
      date: "9:15 a. m.",
      enviadoPorMi: false,
      mensaje: "Bien y tu amorch",
      imagen: Image.network(
        'https://coverfiles.alphacoders.com/225/22527.png',
        fit: BoxFit.fitWidth,
        height: 100,
        width: 300,
      ),
      envioImagen: true,
    ),
    ChatMensaje(
      date: "9:16 a. m.",
      enviadoPorMi: true,
      mensaje: "Bien love",
      imagen: Image.network(
        'https://66.media.tumblr.com/12ae41104d5f48ccb8e6688d843f4114/26ae48d8c498e9b4-a1/s400x600/b6c9dc9399d794cd128ceeb60b9c75e3d473f595.png',
        fit: BoxFit.fitWidth,
        height: 200,
      ),
      envioImagen: true,
    ),
    ChatMensaje(
      date: "9:17 a. m.",
      enviadoPorMi: false,
      mensaje: "Teamo LuzCamposxd",
      imagen: Image.network(
          'https://66.media.tumblr.com/12ae41104d5f48ccb8e6688d843f4114/26ae48d8c498e9b4-a1/s400x600/b6c9dc9399d794cd128ceeb60b9c75e3d473f595.png',
          fit: BoxFit.cover),
      envioImagen: false,
    ),
    ChatMensaje(
      date: "9:18 a. m.",
      enviadoPorMi: true,
      mensaje: "Im a pickle rick",
      envioImagen: false,
    ),
    ChatMensaje(
      date: "9:19 am",
      enviadoPorMi: true,
      mensaje: "Wasaa",
      envioImagen: false,
    ),
    ChatMensaje(
      date: "9:25 a. m.",
      enviadoPorMi: false,
      mensaje: "Wubuaslda",
      imagen: Image.network(
        'https://66.media.tumblr.com/12ae41104d5f48ccb8e6688d843f4114/26ae48d8c498e9b4-a1/s400x600/b6c9dc9399d794cd128ceeb60b9c75e3d473f595.png',
        fit: BoxFit.fitWidth,
        height: 200,
      ),
      envioImagen: true,
    ),
    ChatMensaje(
      date: "9:19 a. m.",
      enviadoPorMi: true,
      mensaje: "Wasaa",
      envioImagen: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF075E54),
        centerTitle: false,
        flexibleSpace:           
            Container(
            margin: EdgeInsets.only(top: 33, left: 45),
            child: InkWell(
               onTap: () => print('Container press'),
                child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  CircleAvatar(
                    radius: 18.0,
                    backgroundColor: Colors.grey,
                    backgroundImage: NetworkImage(data.elementAt(2)),               
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Text(
                      data.elementAt(0),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600),
                    ),
                  
                ],
              ),
            ),
          ),
        
        actions: <Widget>[
          IconButton(icon: Icon(Icons.videocam), onPressed: () {}),
          IconButton(icon: Icon(Icons.call), onPressed: () {}),
          IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    "https://i.pinimg.com/originals/ab/ab/60/abab60f06ab52fa7846593e6ae0c9a0b.png"),
                fit: BoxFit.cover)),
        child: Column(
          children: <Widget>[
            Flexible(
              child: ListView.builder(
                itemCount: mensajes.length,
                itemBuilder: (ctx, i) => renderChat(mensajes[i]),
              ),
            ),
            Divider(),
            Container(
              child: renderTextBox(),
            ),
          ],
        ),
      ),
    );
  }

  Widget renderChat(ChatMensaje mensaje) {
    return Stack(
      alignment:
          mensaje.enviadoPorMi ? Alignment.centerRight : Alignment.centerLeft,
      children: <Widget>[
        mensaje.envioImagen ? _mensajeFoto(mensaje) : _mensajes(mensaje)
      ],
    );
  }

  Widget _mensajeFoto(ChatMensaje mensaje) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
          margin: mensaje.enviadoPorMi
              ? EdgeInsets.only(
                  right: 10.0, left: 140.0, top: 10.0, bottom: 10.0)
              : EdgeInsets.only(
                  left: 10.0, right: 125.0, top: 5.0, bottom: 10.0),
          decoration: mensaje.enviadoPorMi
              ? BoxDecoration(
                  color: Color(0xFFDCF8C6),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 2,
                        color: Color(0x22000000),
                        offset: Offset(1, 2)),
                  ],
                  borderRadius: BorderRadius.circular(4))
              : BoxDecoration(
                  color: Colors.grey[50],
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 2,
                        color: Color(0x22000000),
                        offset: Offset(1, 2)),
                  ],
                  borderRadius: BorderRadius.circular(4)),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                mensaje.mensaje,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
              ),
              SizedBox(width: 10.0),
              Text(
                mensaje.date,
                style: TextStyle(
                    fontSize: 11,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w300),
              ),
              SizedBox(width: 5.0),
              mensaje.enviadoPorMi
                  ? Icon(
                      Icons.done_all,
                      color: Colors.blue[300],
                      size: 15,
                    )
                  : SizedBox()
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(5.0),
          margin: mensaje.enviadoPorMi
              ? EdgeInsets.fromLTRB(0.0, 0.0, 5.0, 5.0)
              : EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 5.0),
          decoration: mensaje.enviadoPorMi
              ? BoxDecoration(
                  color: Color(0xFFDCF8C6),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 2,
                        color: Color(0x22000000),
                        offset: Offset(1, 2)),
                  ],
                  borderRadius: BorderRadius.circular(4))
              : BoxDecoration(
                  color: Colors.grey[50],
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 2,
                        color: Color(0x22000000),
                        offset: Offset(1, 2)),
                  ],
                  borderRadius: BorderRadius.circular(4)),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Stack(
                alignment: mensaje.enviadoPorMi
                    ? Alignment.bottomRight
                    : Alignment.bottomRight,
                children: <Widget>[
                  mensaje.imagen,
                  Positioned(
                    right: 3.0,
                    child: Row(
                      children: <Widget>[
                        Text(
                          mensaje.date,
                          style: TextStyle(
                              fontSize: 11,
                              color: Colors.grey[100],
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(width: 5.0),
                        mensaje.enviadoPorMi
                            ? Icon(
                                Icons.done_all,
                                color: Colors.blue[300],
                                size: 15,
                              )
                            : SizedBox()
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _mensajes(ChatMensaje mensaje) {
    return Column(
      children: <Widget>[
        Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            decoration: mensaje.enviadoPorMi
                ? BoxDecoration(
                    color: Color(0xFFDCF8C6),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 2,
                          color: Color(0x22000000),
                          offset: Offset(1, 2)),
                    ],
                    borderRadius: BorderRadius.circular(4))
                : BoxDecoration(
                    color: Colors.grey[50],
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 2,
                          color: Color(0x22000000),
                          offset: Offset(1, 2)),
                    ],
                    borderRadius: BorderRadius.circular(4)),
            child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Container(
                      child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        mensaje.mensaje,
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w300),
                      ),
                      SizedBox(width: 10.0),
                      Text(
                        mensaje.date,
                        style: TextStyle(
                            fontSize: 11,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w300),
                      ),
                      SizedBox(width: 5.0),
                      mensaje.enviadoPorMi
                          ? Icon(
                              Icons.done_all,
                              color: Colors.blue[300],
                              size: 15,
                            )
                          : SizedBox()
                    ],
                  ))
                ]))
      ],
    );
  }

  Widget renderTextBox() {
    final roundedContainer = ClipRRect(
      borderRadius: BorderRadius.circular(30.0),
      child: Container(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            SizedBox(width: 10.0),
            Icon(Icons.insert_emoticon, size: 25.0, color: Colors.grey[500]),
            SizedBox(width: 8.0),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Type a message',
                  border: InputBorder.none,
                ),
              ),
            ),
            Icon(Icons.attach_file, size: 25.0, color: Colors.grey[500]),
            SizedBox(width: 8.0),
            Icon(Icons.camera_alt, size: 25.0, color: Colors.grey[500]),
            SizedBox(width: 15.0),
          ],
        ),
      ),
    );

    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: roundedContainer,
          ),
          SizedBox(
            width: 4.0,
          ),
          GestureDetector(
            onTap: () {},
            child: FloatingActionButton(
              backgroundColor: Color(0xFF075E54),
              mini: true,
              onPressed: () {},
              child: Icon(Icons.keyboard_voice),
            ),
          )
        ],
      ),
    );
  }
} 
