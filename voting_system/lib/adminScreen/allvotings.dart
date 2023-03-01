import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:voting_system/adminScreen/add_post.dart';
import 'package:voting_system/adminScreen/edit_post.dart';

import '../utils/constants/candidates.dart';
import '../utils/constants/constants.dart';

class AllVotings extends StatefulWidget {
  const AllVotings({super.key});

  @override
  State<AllVotings> createState() => _AllVotingsState();
}

class _AllVotingsState extends State<AllVotings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Votings"),
        centerTitle: true,
        backgroundColor: allBarColor,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) {
              return AddPosts();
            },
          ));
        },
        backgroundColor: allBarColor,
        child: Text(
          "+",
          style: TextStyle(
            fontSize: 40,
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
          child: Container(
        color: allBarColor,
        height: 50,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.home,
                color: Colors.white,
                size: 28,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.person,
                color: Colors.white,
                size: 28,
              ),
            ),
          ],
        ),
      )),
      body: ListView.builder(
        itemCount: candidate.length,
        itemBuilder: (context, index) {
          return Container(
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
              title: Text(candidate[index]['title']),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(candidate[index]['description']),
                  Row(
                    children: [
                      Container(
                        child: Text("active"),
                        padding:
                            EdgeInsets.symmetric(vertical: 2, horizontal: 6),
                        margin:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 5),

                        // color: Colors.red,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: candidate[index]['active']
                              ? Colors.green.shade500
                              : Colors.red,
                        ),
                      ),
                      Container(
                        child: Text(
                          "shown",
                          style: TextStyle(
                            // fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        padding:
                            EdgeInsets.symmetric(vertical: 2, horizontal: 6),
                        margin:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 5),

                        // color: Colors.red,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: candidate[index]['shown']
                              ? Colors.green
                              : Colors.red.shade400,
                        ),
                      )
                    ],
                  ),
                ],
              ),
              trailing: IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => EditPosts(),
                  ));
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
