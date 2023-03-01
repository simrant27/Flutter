// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:voting_system/screens/home_screen.dart';

// utils
import '../utils/constants/constants.dart';

// screens
import '../utils/functions/accessToken.dart';
import '/screens/login_screen.dart';

// components
import '/components/custom_button.dart';
import '/components/custom_textfield.dart';

import 'package:http/http.dart' as http;

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneNoController = TextEditingController();

  RegExp emailRegX = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

  RegExp numberRegx = RegExp(r'^[0-9]');
  // RegExp passwordRegX =
  //     RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$');

  // handlers
  String? nameValidation(String? value) {
    if (value == null || value.isEmpty || value.trim() == '') {
      return 'First Name is required';
    }
    return null;
  }

  String? emailValidation(String? value) {
    if (value == null || value.isEmpty || value.trim() == '') {
      return 'Email is required';
    } else if (!emailRegX.hasMatch(value)) {
      return 'Invalid Email';
    }
    return null;
  }

  String? passwordValidation(String? value) {
    if (value == null || value.isEmpty || value.trim() == '') {
      return 'Password is required';
    }
    return null;
  }

  String? numberValidation(String? value) {
    if (value == null || value.isEmpty || value.trim() == '') {
      return 'Number is required';
    } else if (!numberRegx.hasMatch(value)) {
      return 'Enter valid number';
    }
    return null;
  }

  void handleRegister() async {
    if (_formkey.currentState!.validate()) {
      Map toSend = {
        "email": _emailController.text,
        "password": _passwordController.text,
        "name": _nameController.text,
        "phone": _phoneNoController.text
      };
      String jsonString = jsonEncode(toSend);
      var response = await http.post(
        Uri.parse("$baseURL/auth/register"),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonString,
      );
      var decoded = jsonDecode(response.body);
      if (decoded['status'] == 'success') {
        print("inside success");
        // save token
        String obtainedToken = decoded['data']['tokens']['access']['token'];
        saveToken(obtainedToken);
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => HomeScreen()));
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Successfully registerd ")));
      } else {
        if (decoded.containsKey('message')) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(decoded['message'])));
        }
      }
      // clearData();
    }
  }

  void clearData() {
    _nameController.clear();

    _emailController.clear();
    _passwordController.clear();
    _phoneNoController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: _formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 50.0,
                  ),
                  const Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomTextField(
                    label: 'Name',
                    placeholder: 'Your Name',
                    fieldController: _nameController,
                    handleValidation: nameValidation,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextField(
                    label: 'Email',
                    placeholder: 'Your Email',
                    inputType: TextInputType.emailAddress,
                    fieldController: _emailController,
                    handleValidation: emailValidation,
                    prefixIcon: Icons.email_outlined,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextField(
                    label: 'Password',
                    placeholder: 'Your Password',
                    inputType: TextInputType.emailAddress,
                    fieldController: _passwordController,
                    handleValidation: passwordValidation,
                    prefixIcon: Icons.lock_outline,
                    isPassword: true,
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  CustomTextField(
                    label: 'Phone Number',
                    placeholder: 'Your Phone number',
                    inputType: TextInputType.number,
                    fieldController: _phoneNoController,
                    handleValidation: numberValidation,
                    prefixIcon: Icons.phone_android,
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  RichText(
                    text: const TextSpan(
                      text: 'By signing up, you agree to our ',
                      style: TextStyle(
                        color: kIconColor,
                      ),
                      children: [
                        TextSpan(
                          text: 'Terms & Conditions ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(text: '& '),
                        TextSpan(
                          text: 'Privacy Policy.*',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  CustomButton(
                    name: 'Register',
                    handleClicked: handleRegister,
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account?",
                        style: TextStyle(
                          color: kIconColor,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()),
                          );
                        },
                        child: const Text(
                          "Login now",
                          style: TextStyle(
                            color: kLinkColor,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
