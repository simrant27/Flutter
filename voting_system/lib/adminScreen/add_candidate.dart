import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:voting_system/components/Custom_date_field.dart';
import 'package:voting_system/components/Custom_voting_textfield.dart';

import 'package:voting_system/components/custom_textfield.dart';
import 'package:voting_system/utils/constants/constants.dart';

class AddCandidate extends StatefulWidget {
  const AddCandidate({super.key});

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
              onPressed: () {
                _formkey.currentState!.validate();
              },
              child: Text("Create Candidate"),
            ) //display
          ]),
        ),
      )),
    );
  }
}
