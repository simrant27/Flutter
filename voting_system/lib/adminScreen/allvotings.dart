import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:voting_system/adminScreen/add_post.dart';
import 'package:voting_system/adminScreen/edit_post.dart';
import 'package:voting_system/models/voting.dart';
import 'package:voting_system/provider/user_provider.dart';
import 'package:voting_system/provider/voting_provider.dart';

import '../models/user.dart';
import '../utils/constants/candidates.dart';
import '../utils/constants/constants.dart';
import 'package:http/http.dart' as http;

class AllVotings extends StatefulWidget {
  const AllVotings({super.key});

  @override
  State<AllVotings> createState() => _AllVotingsState();
}

class _AllVotingsState extends State<AllVotings> {
  @override
  Widget build(BuildContext context) {
    return Consumer<VotingProvider>(builder: (context, votingProvider, child) {
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
          itemCount: votingProvider.votings.length,
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
                title: Text(votingProvider.votings[index].title),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(votingProvider.votings[index].description),
                    // Text(votingProvider.votings[index].from.toString()),
                    Text(dateformatter
                        .format(votingProvider.votings[index].from)),
                    Text(
                        dateformatter.format(votingProvider.votings[index].to)),
                    Text(votingProvider.votings[index].candidates.length
                        .toString()),
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
                              color: votingProvider.votings[index].status ==
                                      "hidden"
                                  ? Colors.red
                                  : Colors.green),
                        ),
                      ],
                    ),
                  ],
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => EditPosts(
                            voting: votingProvider.votings[index],
                          ),
                        ));
                      },
                    ),
                    IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text("Are you sure?"),
                              content: Text("This cant be undone"),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text("cancel")),
                                TextButton(
                                  onPressed: () async {
                                    User loggedInUser =
                                        Provider.of<UserProvider>(context,
                                                listen: false)
                                            .user!;

                                    var response = await http.delete(
                                      Uri.parse(
                                          "$baseURL/votings/${votingProvider.votings[index].id}"),
                                      headers: {
                                        'Content-Type': 'application/json',
                                        'Authorization':
                                            "Bearer ${loggedInUser.token}",
                                      },
                                    );
                                    // print(response);
                                    var decoded = jsonDecode(response.body);

                                    if (decoded['status'] == "success") {
                                      Provider.of<VotingProvider>(context,
                                              listen: false)
                                          .deleteVoting(
                                              votingProvider.votings[index]);
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content: Text(
                                                  "Deleted successfully")));
                                      Navigator.of(context).pop();
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content: Text("cannot delete" +
                                                  decoded["data"].toString())));
                                      print(decoded);
                                      Navigator.of(context).pop();
                                    }
                                  },
                                  child: Text("delete"),
                                )
                              ],
                            ),
                          );
                        },
                        icon: Icon(Icons.delete))
                  ],
                ),
              ),
            );
          },
        ),
      );
    });
  }
}
