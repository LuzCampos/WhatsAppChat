import 'package:flutter/material.dart';
import 'package:whatsappmodel/models/ChatListItem.dart';
import 'package:whatsappmodel/models/ChatMensaje.dart';

class ChatScreen extends StatelessWidget {
  final ChatListItem person;

  ChatScreen({this.person});

  final List<ChatMensaje> mensajes = [
    ChatMensaje(
      date: "9:10 a. m.",
      enviadoPorMi: true,
      mensaje: "Hola xd",
    ),
    ChatMensaje(
      date: "9:11 a. m.",
      enviadoPorMi: true,
      mensaje: "Que tal?",
    ),
    ChatMensaje(
      date: "9:15 a. m.",
      enviadoPorMi: false,
      mensaje: "Bien y tu amorch",
    ),
    ChatMensaje(
      date: "9:16 a. m.",
      enviadoPorMi: true,
      mensaje: "Bien love",
    ),
    ChatMensaje(
      date: "9:17 a. m.",
      enviadoPorMi: false,
      mensaje: "Teamo LuzCamposxd",
    ),
    ChatMensaje(
      date: "9:18 a. m.",
      enviadoPorMi: true,
      mensaje: "Im a pickle rick",
    ),
    ChatMensaje(
      date: "9:19 am",
      enviadoPorMi: true,
      mensaje: "Wasaa",
    ),
    ChatMensaje(
      date: "9:25 a. m.",
      enviadoPorMi: false,
      mensaje: "Wubuaslda",
    ),
    ChatMensaje(
      date: "9:19 a. m.",
      enviadoPorMi: true,
      mensaje: "Wasaa",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF075E54),
        centerTitle: false,
        flexibleSpace: Container(
          margin: EdgeInsets.only(top: 33, left: 45),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              CircleAvatar(
                radius: 18.0,
                backgroundColor: Colors.grey,
                backgroundImage: NetworkImage(person.profileURL),
              ),
              SizedBox(
                width: 8.0,
              ),
              Text(
                person.personName,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600),
              ),
            ],
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
              image: NetworkImage("https://i.pinimg.com/originals/ab/ab/60/abab60f06ab52fa7846593e6ae0c9a0b.png"),
              fit: BoxFit.cover
              )
        ),
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
    return Column(
      children: <Widget>[
        Align(
          alignment: mensaje.enviadoPorMi
              ? Alignment.centerRight
              : Alignment.centerLeft,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
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
                        //color: Colors.grey[600],
                        color: Colors.blue[300],
                        size: 15,
                      )
                    : SizedBox()
              ],
            ),
          ),
        ),
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
