import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> activeUser = [
    {
      "name": "Asmita",
      "profileURL": "http://xsgames.co/randomusers/assets/avatars/pixel/4.jpg",
    },
    {
      "name": "Oshin",
      "profileURL": "http://xsgames.co/randomusers/assets/avatars/pixel/5.jpg",
    },
    {
      "name": "Rohit",
      "profileURL": "http://xsgames.co/randomusers/assets/avatars/pixel/6.jpg",
    },
    {
      "name": "Rupesh",
      "profileURL": "http://xsgames.co/randomusers/assets/avatars/pixel/7.jpg",
    },
    {
      "name": "Sapana",
      "profileURL": "http://xsgames.co/randomusers/assets/avatars/pixel/8.jpg",
    },
    {
      "name": "Harry",
      "profileURL": "http://xsgames.co/randomusers/assets/avatars/pixel/9.jpg",
    },
    {
      "name": "Sonali",
      "profileURL": "http://xsgames.co/randomusers/assets/avatars/pixel/10.jpg",
    },
    {
      "name": "Prema",
      "profileURL": "http://xsgames.co/randomusers/assets/avatars/pixel/1.jpg",
    },
    {
      "name": "Jyoti",
      "profileURL": "http://xsgames.co/randomusers/assets/avatars/pixel/2.jpg",
    },
    {
      "name": "Ram",
      "profileURL": "http://xsgames.co/randomusers/assets/avatars/pixel/3.jpg",
    },
    {
      "name": "Shyam",
      "profileURL": "http://xsgames.co/randomusers/assets/avatars/pixel/14.jpg",
    },
  ];

  List<Map<dynamic, dynamic>> chats = [
    {
      "profileURL": "http://xsgames.co/randomusers/assets/avatars/pixel/4.jpg",
      "name": "MJ❤️‍🩹",
      "seen": false,
      "messageTime": "12:34 am",
      "lastMessage": "k xa",
      "sentby": "me:",
      "hasMissedCall": false,
      "hasOngoingCall": true,
    },
    {
      "profileURL": "http://xsgames.co/randomusers/assets/avatars/pixel/16.jpg",
      "name": "Sapana",
      "seen": true,
      "messageTime": "12:00 am",
      "lastMessage": "Happy Birthday",
      "sentby": "",
      "hasMissedCall": false,
      "hasOngoingCall": false,
    },
    {
      "profileURL": "http://xsgames.co/randomusers/assets/avatars/pixel/20.jpg",
      "name": "Oshin",
      "seen": false,
      "messageTime": "6:00 pm",
      "lastMessage": "hello",
      "sentby": "me:",
      "hasMissedCall": true,
      "hasOngoingCall": false,
    },
    {
      "profileURL": "http://xsgames.co/randomusers/assets/avatars/pixel/18.jpg",
      "name": "Rohit",
      "seen": true,
      "messageTime": "6:30 pm",
      "lastMessage": "marlas hai ahile talai pakh la la la lala ",
      "sentby": "me:",
      "hasMissedCall": false,
      "hasOngoingCall": false,
    },
    {
      "profileURL": "http://xsgames.co/randomusers/assets/avatars/pixel/9.jpg",
      "name": "Rupesh",
      "seen": false,
      "messageTime": "6:15 am",
      "lastMessage": "k xa khabar",
      "sentby": "me:",
      "hasMissedCall": false,
      "hasOngoingCall": false,
    },
    {
      "profileURL": "http://xsgames.co/randomusers/assets/avatars/pixel/18.jpg",
      "name": "Ranju",
      "seen": false,
      "messageTime": "6:00 pm",
      "lastMessage": "hello",
      "sentby": "me:",
      "hasMissedCall": true,
      "hasOngoingCall": false,
    },
    {
      "profileURL": "http://xsgames.co/randomusers/assets/avatars/pixel/34.jpg",
      "name": "Kushal",
      "seen": true,
      "messageTime": "5:20 pm",
      "lastMessage": "k xa mero vai",
      "sentby": "me:",
      "hasMissedCall": false,
      "hasOngoingCall": false,
    },
    {
      "profileURL": "http://xsgames.co/randomusers/assets/avatars/pixel/22.jpg",
      "name": "Rejina",
      "seen": false,
      "messageTime": "2:30 pm",
      "lastMessage": "Simran",
      "sentby": "me:",
      "hasMissedCall": false,
      "hasOngoingCall": false,
    },
    {
      "profileURL": "http://xsgames.co/randomusers/assets/avatars/pixel/2.jpg",
      "name": "Arjun",
      "seen": true,
      "messageTime": "1:00 pm",
      "lastMessage": "Dai",
      "sentby": "me:",
      "hasMissedCall": false,
      "hasOngoingCall": false,
    },
    {
      "profileURL": "http://xsgames.co/randomusers/assets/avatars/pixel/4.jpg",
      "name": "DBJ",
      "seen": true,
      "messageTime": "11:30 am",
      "lastMessage": "gareu?",
      "sentby": "me:",
      "hasMissedCall": false,
      "hasOngoingCall": false,
    },
  ];

  List<Map<dynamic, dynamic>> last = [
    {
      "name": "Chat",
      "icon": Icons.chat,
    },
    {
      "name": "Call",
      "icon": Icons.video_camera_back,
    },
    {
      "name": "People",
      "icon": Icons.people,
    },
    {
      "name": "Stories",
      "icon": Icons.photo,
    },
    {
      "name": "Setting",
      "icon": Icons.person,
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.blue),
        title: Text(
          "Chats",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.black,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(Icons.chat_rounded),
          )
        ],
        elevation: 0,
      ),
      drawer: Drawer(),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              for (var l in last)
                Column(
                  children: [
                    Icon(
                      l["icon"],
                      color: Colors.grey,
                    ),
                    Text(l["name"]),
                  ],
                )
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    for (var user in activeUser)
                      Column(
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(
                              user["profileURL"],
                            ),
                          ),
                          Text(user["name"]),
                          SizedBox(
                            width: 64,
                          )
                        ],
                      ),
                    SizedBox(
                      width: 10,
                    )
                  ],
                ),
              ),
              for (var user in chats)
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(user["profileURL"]),
                  ),
                  title: Text(
                    user["name"],
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),

                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      user["hasMissedCall"]
                          ? Row(
                              children: [
                                Icon(
                                  Icons.phone_callback_rounded,
                                  color: Colors.red,
                                ),
                                Text(
                                  "Missed Call",
                                  style: TextStyle(
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            )
                          : user["hasOngoingCall"]
                              ? Text(
                                  user["name"] + " started a video call",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                )
                              : user["seen"]
                                  ? Flexible(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          // user["sentby"
                                          //     ? Text(user["sentby"])
                                          //     : Text(""),
                                          Text(user["sentby"]),
                                          Flexible(
                                            // width: 100,
                                            child: Text(
                                              user["lastMessage"],
                                              style: TextStyle(
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  : Flexible(
                                      child: Text(
                                        user["lastMessage"],
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(user["messageTime"]),
                    ],
                  ),
                  trailing: Container(
                    // padding: EdgeInsets.only(left: 50),
                    // width: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        user["hasMissedCall"]
                            ? Icon(
                                Icons.call,
                                color: Colors.black,
                              )
                            : Text(""),
                        SizedBox(
                          width: 10,
                        ),
                        user["seen"]
                            ? CircleAvatar(
                                backgroundImage:
                                    NetworkImage(user["profileURL"]),
                                radius: 8,
                              )
                            : Icon(
                                Icons.circle,
                                size: 16,
                                color: Colors.blue,
                              ),
                      ],
                    ),
                  ),
                  // trailing: Icon(Icons.circle,),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
