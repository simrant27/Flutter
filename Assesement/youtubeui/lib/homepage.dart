import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:youtubeui/search.dart';

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

var bottomNavColor = Color.fromRGBO(255, 255, 255, 1);
var bottomIconSize = 28.0;
var bottomNavText = TextStyle(
  color: Colors.white,
  fontSize: 12,
);
var bodyTitleText = TextStyle(
  color: Colors.white,
  fontSize: 16,
);
var bodyTitleBox = SizedBox(
  width: 10,
);
var bodySubTitleText = TextStyle(
  color: Colors.white70,
);

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      key: _scaffoldKey,
      appBar: AppBar(
        leadingWidth: 150,
        leading: InkWell(
          child: Row(
            children: [
              Icon(
                Icons.play_circle_fill_outlined,
                color: Colors.red,
              ),
              Text(
                "YOUTUBE",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
          onTap: () {
            _scaffoldKey.currentState!.openDrawer();
          },
        ),
        // title: Container(
        //   child: Row(
        //     children: [
        //       Text("YOUTUBE"),
        //     ],
        //   ),
        // ),
        backgroundColor: Colors.black,
        toolbarHeight: 50,
        elevation: 5,
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(Icons.add_box_sharp),
              SizedBox(
                width: 10,
              ),
              Icon(Icons.notifications),
              IconButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Search()));
                },
                icon: Icon(Icons.search),
              ),
              CircleAvatar(
                backgroundImage: AssetImage("assets/profile.jpg"),
                radius: 12,
              ),
              SizedBox(
                width: 10,
              ),
              // Image(
              //   image: AssetImage("assets/profile.jpg"),
              //   height: 50,
              //   width: 50,
              // )
            ],
          )
        ],
      ),
      drawer: Drawer(),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          // height: 60,
          // decoration: BoxDecoration(color: Colors.black),
          color: Colors.black,
          padding: EdgeInsets.symmetric(vertical: 12),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.home_filled,
                      color: bottomNavColor,
                      size: bottomIconSize,
                    ),
                    Text(
                      "Home",
                      style: bottomNavText,
                    )
                  ],
                  // children: [
                  //   IconButton(
                  //     onPressed: () {},
                  //     icon: Icon(
                  //       Icons.home,
                  //       color: Colors.white,
                  //     ),
                  //   ),
                  // ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.video_stable_outlined,
                      color: bottomNavColor,
                      size: bottomIconSize,
                    ),
                    Text(
                      "Shorts",
                      style: bottomNavText,
                    ),
                  ],
                ),
                Icon(
                  Icons.add_circle_outline,
                  color: bottomNavColor,
                  size: bottomIconSize,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.subscriptions_outlined,
                      color: bottomNavColor,
                      size: bottomIconSize,
                    ),
                    Text(
                      "Subscription",
                      style: bottomNavText,
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.video_collection_outlined,
                      color: bottomNavColor,
                      size: bottomIconSize,
                    ),
                    Text(
                      "Library",
                      style: bottomNavText,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                child: Column(
                  children: [
                    Image(
                      image: AssetImage("assets/tmkoc.jpg"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 8, top: 8, right: 8, bottom: 16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            backgroundImage:
                                AssetImage("assets/tmkoc_logo.webp"),
                          ),
                          bodyTitleBox,
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Tarak Meheta Ka Ooltah Chashmah - Episode 687 - Full Episode",
                                  style: bodyTitleText,
                                ),
                                Text(
                                  "Tarak Meheta Ka Ooltah Chashmah episodes . 1.2M views. 2 years ago",
                                  style: bodySubTitleText,
                                ),
                              ],
                            ),
                          ),
                          Icon(
                            Icons.more_vert,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Image(
                      image: AssetImage("assets/fluuter.jpg"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 8, top: 8, right: 8, bottom: 16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            backgroundImage:
                                AssetImage("assets/flutter_logo.jpg"),
                          ),
                          bodyTitleBox,
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "How to Install Flutter in Windows? - FLutter Installation Tutorial",
                                  style: bodyTitleText,
                                ),
                                Text(
                                  "wsube Tech . 75k views . 5 months ago",
                                  style: bodySubTitleText,
                                ),
                              ],
                            ),
                          ),
                          Icon(
                            Icons.more_vert,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Image(
                      image: AssetImage("assets/java.jpg"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 8, top: 8, right: 8, bottom: 16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage("assets/java_logo.png"),
                          ),
                          bodyTitleBox,
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Java Full Course In Nepali - New Course",
                                  style: bodyTitleText,
                                ),
                                Text(
                                  "Technology Channel . 44K views . 6 months ago",
                                  style: bodySubTitleText,
                                ),
                              ],
                            ),
                          ),
                          Icon(
                            Icons.more_vert,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
