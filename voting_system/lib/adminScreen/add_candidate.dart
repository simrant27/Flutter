import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:voting_system/components/Custom_date_field.dart';
import 'package:voting_system/components/Custom_voting_textfield.dart';

import 'package:voting_system/components/custom_textfield.dart';
import 'package:voting_system/models/candidate.dart';
import 'package:voting_system/models/voting.dart';
import 'package:voting_system/provider/user_provider.dart';
import 'package:voting_system/utils/constants/constants.dart';

import '../models/user.dart';
import 'package:http/http.dart' as http;

import '../provider/voting_provider.dart';

class AddCandidate extends StatefulWidget {
  String votingId;
  AddCandidate({super.key, required this.votingId});

  @override
  State<AddCandidate> createState() => _AddCandidateState();
}

class _AddCandidateState extends State<AddCandidate> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  final TextEditingController _tittleController = TextEditingController();
  final TextEditingController _descriptionCOntroller = TextEditingController();

  String? titleValidation(String? value) {
    if (value == null || value.isEmpty || value.trim() == '') {
      return 'Title validation';
    }
    return null;
  }

  String? descriptionValidation(String? value) {
    if (value == null || value.isEmpty || value.trim() == '') {
      return 'Enter a title';
    }
    return null;
  }

  // final TextEditingController _description = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Voting"),
        backgroundColor: allBarColor,
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
      body: SafeArea(
          child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Form(
          key: _formkey,
          child: Column(children: [
            CustomTextField(
              label: "Title",
              placeholder: "Enter title",
              fieldController: _tittleController,
              handleValidation: titleValidation,
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextField(
              label: "Description",
              placeholder: "Enter descriptiom",
              fieldController: _descriptionCOntroller,
              handleValidation: descriptionValidation,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: allBarColor,
                minimumSize: Size.fromHeight(42), // NEW
              ),
              onPressed: () async {
                if (_formkey.currentState!.validate()) {
                  Map<String, dynamic> toSend = {
                    "name": _tittleController.text,
                    "description": _descriptionCOntroller.text,
                  };
                  //to json Sting
                  String toJSONString = jsonEncode(toSend);

                  //sending to server
                  User loggedInUser =
                      Provider.of<UserProvider>(context, listen: false).user!;

                  var response = await http.post(
                    Uri.parse("$baseURL/votings/${widget.votingId}/candidates"),
                    headers: {
                      'Content-Type': 'application/json',
                      'Authorization': "Bearer ${loggedInUser.token}",
                    },
                    body: toJSONString,
                  );

                  var decodedResponse = jsonDecode(response.body);
                  if (decodedResponse['status'] == "success") {
                    Candidate addedCandidate =
                        Candidate.fromJson(decodedResponse['data']);
                    Provider.of<VotingProvider>(context, listen: false)
                        .addCandiate(addedCandidate);
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Created successfully")));
                    Navigator.of(context).pop();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("cannoted to created: ")));
                  }
                }
              },
              child: Text("Create Candidate"),
            ) //display
          ]),
        ),
      )),
    );
  }
}
