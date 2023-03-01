import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:voting_system/components/Custom_date_field.dart';
import 'package:voting_system/components/Custom_voting_textfield.dart';

import 'package:voting_system/components/custom_textfield.dart';
import 'package:voting_system/utils/constants/constants.dart';

class AddPosts extends StatefulWidget {
  const AddPosts({super.key});

  @override
  State<AddPosts> createState() => _AddPostsState();
}

class _AddPostsState extends State<AddPosts> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  final TextEditingController _tittleController = TextEditingController();
  final TextEditingController _descriptionCOntroller = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

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

  DateTime _date = DateTime.now();

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
            CustomVotingField(
              label: "Start Date",
              placeholder: "Enter Start Date",
              // fieldController: _dateController,
              handleValidation: dateValidation,
              suffixIcon: Icons.calendar_month_outlined,
            ),
            CustomVotingField(
              label: "End Date",
              placeholder: "Enter Start Date",
              // fieldController: _dateController,
              handleValidation: dateValidation,
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
              onPressed: () {
                _formkey.currentState!.validate();
              },
              child: Text("Submit"),
            ) //display
          ]),
        ),
      )),
    );
  }
}
