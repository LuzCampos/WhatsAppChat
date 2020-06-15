import 'package:flutter/material.dart';
import 'package:whatsappmodel/models/ChatListItem.dart';
import 'package:whatsappmodel/pages/ChatScreen.dart';

class ChatsTab extends StatelessWidget {

  final List<ChatListItem> chatListItems = [
    ChatListItem(
        profileURL: "https://i.pinimg.com/474x/92/25/74/92257450f0799b77afdee17a09e4d4b0.jpg",
        personName: "Sasuke",
        date: "11:00 pm",
        lastMessage: "Te amo bb"
    ),

    ChatListItem(
        profileURL: "https://66.media.tumblr.com/ae2dcfe1e3e077b88b98e41dce15e986/57942e5750558949-8d/s640x960/f84635dc3b652bb9e64de17cffcb8f48ba4a3ef3.jpg",
        personName: "Datebayo",
        date: "10:40 pm",
        lastMessage: "Seré hokage de verás"
    ),

    ChatListItem(
        profileURL: "https://66.media.tumblr.com/5978c00380e3c9a0180ad5e468f694c7/d02f1e76f74e1f50-2c/s1280x1920/dad4ce026a93c5fe88436cc75ab43c1788f5b107.jpg",
        personName: "Itachi",
        date: "10:30 pm",
        lastMessage: "Te amo Luz"
    ),

    ChatListItem(
        profileURL: "https://i.pinimg.com/474x/c7/ed/96/c7ed96a6e250650afeaed16a3f368720.jpg",
        personName: "Hinata",
        date: "9:00 am",
        lastMessage: "Yo te protegeré Naruto Kun"

    ),

    ChatListItem(
        profileURL: "https://i.pinimg.com/474x/8a/c2/70/8ac270ae11f3be9659390e580d552e05.jpg",
        personName: "Kakashi",
        date: "8:05 am",
        lastMessage: "Estuvo genial anoche"

    ),

    ChatListItem(
        profileURL: "https://66.media.tumblr.com/12cd418f678ee95bc73fc66a152224f7/8edbf47c60632436-83/s640x960/4ae77a461e5b3dbddf2550b75ec8d643fd34b1d9.png",
        personName: "Tsunade",
        date: "7:20 am",
        lastMessage: "No te tocaba Jiraiya"

    ),

    ChatListItem(
        profileURL: "https://66.media.tumblr.com/99ea83fa9ba929638f54125d347eceed/tumblr_pqcnclF34V1u1ycqw_540.jpg",
        personName: "Sakura",
        date: "6:30 am",
        lastMessage: "Guau guau"

    ),

    ChatListItem(
        profileURL: "https://66.media.tumblr.com/108a1c9bc236dd4ad4313a5308218627/9887a8c3ace369a4-78/s640x960/815c2e7cb683a8a7762ea47e5a3b2a97f0ea00b1.jpg",
        personName: "Konan",
        date: "5:00 am",
        lastMessage: "Dolro dolorfbhhdfb xd"

    ),

    ChatListItem(
        profileURL: "https://i.pinimg.com/originals/34/e9/57/34e9577706d8e27ba3a1aa588b1a7d47.png",
        personName: "Nagato",
        date: "7:00 am",
        lastMessage: "Shinra Tensei"

    ),

  ];


  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: chatListItems.length,
      separatorBuilder: (ctx, i){
        return Divider();
      },
      itemBuilder: (ctx, i){
        return ListTile(
            title: Text(chatListItems[i].personName),
            subtitle: 
            Container(
              child: Row(
                children: <Widget>[
                  Icon(Icons.done_all, size: 15,),
                  SizedBox(width:5.0),
                  Text(chatListItems[i].lastMessage),
                ],
              )),
            trailing: Text(chatListItems[i].date , style: TextStyle(fontSize: 12.0),),
            leading: CircleAvatar(
              backgroundColor: Colors.grey,
              backgroundImage: NetworkImage(
                chatListItems[i].profileURL
              ),
            ),
         onTap: (){
           Navigator.push(
             context,
              MaterialPageRoute(
                builder: (context) => ChatScreen(
                  person: chatListItems[i],
                )
                )
                );
         },   
        );
      },
      );
  }
}