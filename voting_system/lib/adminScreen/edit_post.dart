import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:voting_system/adminScreen/add_candidate.dart';
import 'package:voting_system/components/Custom_date_field.dart';
import 'package:voting_system/components/Custom_voting_textfield.dart';

import 'package:voting_system/components/custom_textfield.dart';
import 'package:voting_system/models/user.dart';
import 'package:voting_system/models/voting.dart';
import 'package:voting_system/provider/user_provider.dart';
import 'package:voting_system/provider/voting_provider.dart';
import 'package:voting_system/utils/constants/constants.dart';
import 'package:http/http.dart' as http;

class EditPosts extends StatefulWidget {
  Voting voting;

  EditPosts({super.key, required this.voting});

  @override
  State<EditPosts> createState() => _EditPostsState();
}

class _EditPostsState extends State<EditPosts> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  final TextEditingController _tittleController = TextEditingController();
  final TextEditingController _descriptionCOntroller = TextEditingController();
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();
  late bool _isChecked = widget.voting.status == 'shown';

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

  late DateTime _startDate = widget.voting.from;
  late DateTime _endDate = widget.voting.to;
  // bool _isChecked = false;

  @override
  void initState() {
    super.initState();
    _tittleController.text = widget.voting.title;
    _descriptionCOntroller.text = widget.voting.description;

    _startDateController.text = dateformatter.format(_startDate);
    _startDateController.text = dateformatter.format(_endDate);
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

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Shown?:",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                    color: kIconColor,
                  ),
                ),
                Checkbox(
                  value: _isChecked,
                  onChanged: (value) {
                    setState(() {
                      _isChecked = value!;
                    });
                  },
                )
              ],
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
                    "status": _isChecked ? "shown" : "hidden",
                  };

// to json string
                  String toJSONString = jsonEncode(toSend);

                  User loggedInUser =
                      Provider.of<UserProvider>(context, listen: false).user!;

                  var response = await http.put(
                    Uri.parse("$baseURL/votings/${widget.voting.id}"),
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
                        SnackBar(content: Text("Edited successfully")));
                    Navigator.of(context).pop();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("cannoted to edited: " +
                            toMap['data'].toString())));
                  }

                  print(response.body);
                }
              },
              child: Text("Update Post"),
            ),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey.shade200,
                foregroundColor: Colors.black54,
                minimumSize: Size.fromHeight(50), // NEW
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          AddCandidate(votingId: widget.voting.id),
                    ));
              },
              child: Text(
                "Add Candidates",
              ),
            ),
            SizedBox(
              height: 16,
            ), //display
          ]),
        ),
      )),
    );
  }
}
