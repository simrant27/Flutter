import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:voting_system/components/Custom_date_field.dart';
import 'package:voting_system/components/Custom_voting_textfield.dart';

import 'package:voting_system/components/custom_textfield.dart';
import 'package:voting_system/models/user.dart';
import 'package:voting_system/provider/user_provider.dart';
import 'package:voting_system/utils/constants/constants.dart';
import 'package:http/http.dart' as http;

import '../models/voting.dart';
import '../provider/voting_provider.dart';

class AddPosts extends StatefulWidget {
  const AddPosts({super.key});

  @override
  State<AddPosts> createState() => _AddPostsState();
}

class _AddPostsState extends State<AddPosts> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  final TextEditingController _tittleController = TextEditingController();
  final TextEditingController _descriptionCOntroller = TextEditingController();
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();

  String? titleValidation(String? value) {
    if (value == null || value.isEmpty || value.trim() == '') {
      return 'Enter title ';
    }
    return null;
  }

  String? descriptionValidation(String? value) {
    if (value == null || value.isEmpty || value.trim() == '') {
      return 'Enter description';
    }
    return null;
  }

  String? dateValidation(String? value) {
    if (value == null || value.isEmpty || value.trim() == '') {
      return '';
    }
    return null;
  }

  DateTime _startDate = DateTime.now();
  DateTime _endDate = DateTime.now();

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
            CustomDatePicker(
              date: _startDate,
              onChanged: (dateTime) {
                setState(() {
                  _startDate = dateTime;
                });
              },
              label: "Start Date",
              placeholder: "Enter Start Date",
              fieldController: _startDateController,
              // handleValidation: dateValidation,
              suffixIcon: Icons.calendar_month_outlined,
            ),
            CustomDatePicker(
              onChanged: (dateTime) {
                setState(() {
                  _endDate = dateTime;
                });
              },
              date: _endDate,
              label: "End Date",
              placeholder: "Enter Start Date",
              fieldController: _endDateController,
              // handleValidation: dateValidation,
              suffixIcon: Icons.calendar_month_outlined,
            ),
            SizedBox(
              height: 16,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: allBarColor,
                minimumSize: Size.fromHeight(50), // NEW
              ),
              onPressed: () async {
                // _formkey.currentState!.validate();
                if (_formkey.currentState!.validate()) {
                  Map<String, dynamic> toSend = {
                    "title": _tittleController.text,
                    "description": _descriptionCOntroller.text,
                    "from": _startDate.millisecondsSinceEpoch,
                    "to": _endDate.millisecondsSinceEpoch,
                  };

// to json string
                  String toJSONString = jsonEncode(toSend);

// sending to server
                  print(toJSONString);

                  User loggedInUser =
                      Provider.of<UserProvider>(context, listen: false).user!;

                  var response = await http.post(
                    Uri.parse("$baseURL/votings"),
                    headers: {
                      'Content-Type': 'application/json',
                      'Authorization': "Bearer ${loggedInUser.token}",
                    },
                    body: toJSONString,
                  );
                  Map<String, dynamic> toMap = jsonDecode(response.body);
                  if (toMap['status'] == "success") {
                    Voting editedVoting = Voting.fromJson(toMap['data']);
// sending to server
                    // print(toJSONString);

                    Provider.of<VotingProvider>(context, listen: false)
                        .setVoting(editedVoting);

                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Added successfully")));
                    Navigator.of(context).pop();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                            "cannoted to Added: " + toMap['data'].toString())));
                  }

                  print(response.body);
                }
              },
              child: Text("Create Post"),
            ) //display
          ]),
        ),
      )),
    );
  }
}
