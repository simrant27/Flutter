import 'package:flutter/material.dart';
import 'package:form_assignment/login.dart';
import 'package:form_assignment/signin.dart';

void main() {
  runApp(Form());
}

class Form extends StatefulWidget {
  const Form({super.key});

  @override
  State<Form> createState() => _FormState();
}

class _FormState extends State<Form> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(),
    );
  }
}
