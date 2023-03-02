import 'package:flutter/material.dart';
import 'package:voting_system/screens/login_screen.dart';
import 'package:voting_system/screens/profile_screen.dart';
import 'package:voting_system/screens/splash_screen.dart';

import '../utils/constants/candidates.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Icon openingIcon = Icon(
    Icons.access_time_outlined,
    color: Colors.green,
  );
  Icon closingIcon = Icon(
    Icons.access_time_outlined,
    color: Colors.red,
  );
  Icon countIcon = Icon(
    Icons.person,
  );
  SizedBox gap = SizedBox(
    width: 10,
  );
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post List"),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomAppBar(
          child: Container(
        color: Colors.blue,
        height: 50,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.home,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.insert_drive_file_rounded,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => ProfileScreen(),
                ));
              },
              icon: Icon(
                Icons.person,
                color: Colors.white,
              ),
            ),
          ],
        ),
      )),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: ListView.builder(
            itemCount: candidate.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SplashScreen(),
                      ));
                  print("clicked");
                },
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 4),
                          blurRadius: 10,
                          color: Colors.black12),
                    ],
                  ),
                  child: ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          candidate[index]["title"],
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        IconButton(
                          icon: Icon(Icons.more_vert),
                          onPressed: () {},
                        )
                      ],
                    ),
                    subtitle: Column(children: [
                      Row(
                        children: [
                          openingIcon,
                          gap,
                          Text(candidate[index]["opening"]),
                        ],
                      ),
                      Row(
                        children: [
                          closingIcon,
                          gap,
                          Text(candidate[index]["closing"]),
                        ],
                      ),
                      Row(
                        children: [
                          countIcon,
                          gap,
                          Text(candidate[index]["count"].toString()),
                        ],
                      ),
                    ]),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
