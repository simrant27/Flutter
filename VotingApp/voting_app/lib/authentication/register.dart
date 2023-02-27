import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:voting_app/authentication/login.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _forName = TextEditingController();

  TextEditingController _forPassword = TextEditingController();
  TextEditingController _forEmail = TextEditingController();
  TextEditingController _fornumber = TextEditingController();

  RegExp emailRegX = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  RegExp passwordRegX =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$');

  RegExp phoneRegx = RegExp(r'([0-9])');

  void handleRegister() async {
    if (_formKey.currentState!.validate()) {
      print(
          'name: ${_forName.text},  email: ${_forEmail.text}, password: ${_forPassword.text}, role: $_fornumber');

      Map toSend = {
        'name': _forName,
        'email': _forEmail,
        'password': _forPassword,
        'phoneNo': _fornumber,
      };

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text(
            'Register Successfull',
          ),
          backgroundColor: Colors.green.shade300,
          behavior: SnackBarBehavior.floating,
          duration: const Duration(
            milliseconds: 2500,
          ),
          action: SnackBarAction(
            label: 'Dismiss',
            // disabledTextColor: kLightColor,
            textColor: Colors.red,
            onPressed: () {
              ScaffoldMessenger.of(context).removeCurrentSnackBar();
            },
          ),
        ),
      );
      clearData();
    }
  }

  void clearData() {
    _forName.clear();

    _forEmail.clear();
    _forPassword.clear();
    _fornumber.clear();
  }

  List<DropdownMenuItem<String>> roles = const [
    DropdownMenuItem(
      value: "user",
      child: Text("USER"),
    ),
    DropdownMenuItem(
      value: "admin",
      child: Text("Admin"),
    ),
  ];
  @override
  bool hidePassword = true;
  String _selectedRole = "user";
  var boxInBetween = SizedBox(
    height: 20,
  );
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 0, top: 26),
          child: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 70,
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 30),
                  ),
                  boxInBetween,
                  Text("Your Name"),
                  TextFormField(
                    controller: _forName,
                    // autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (v) {
                      if (v == null || v.trim().length == 0) {
                        return "Enter your Name";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: "Your Name",
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.all(8)),
                  ),
                  boxInBetween,
                  Text("Email"),
                  TextFormField(
                    controller: _forEmail,
                    validator: (v) {
                      if (v == null || v.trim().length == 0) {
                        return "Email required";
                      } else if (!emailRegX.hasMatch(v)) {
                        return 'Invalid Email';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: "Your Email",
                        prefixIcon: Icon(Icons.email_outlined),
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.all(8)),
                  ),
                  boxInBetween,
                  Text("Password"),
                  TextFormField(
                    controller: _forPassword,
                    validator: (v) {
                      if (v == null || v.trim().length == 0) {
                        return "Enter Password";
                      } else if (!passwordRegX.hasMatch(v)) {
                        return 'Invalid Password';
                      }
                      return null;
                    },
                    obscureText: hidePassword,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              hidePassword = !hidePassword;
                            });
                          },
                          icon: hidePassword
                              ? Icon(Icons.visibility)
                              : Icon(Icons.visibility_off),
                        ),
                        hintText: "Your Password",
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.all(8)),
                  ),
                  boxInBetween,
                  Text("Phone number"),
                  TextFormField(
                    controller: _forName,
                    // autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (v) {
                      if (v == null || v.trim().length == 0) {
                        return "Enter your Number";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: "Your Name",
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.all(8)),
                  ),
                  boxInBetween,
                  Wrap(
                    children: [
                      Text("By signing up you agree to our "),
                      Text(
                        "Terms and Condtion ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text("and "),
                      Text(
                        "Privacy Policy. ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text("*"),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.purple.shade200,
                          ),
                          onPressed: () {
                            // _formKey.currentState!.validate();
                            handleRegister();
                          },
                          child: Text("Continue"),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Already Signed up? "),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => Login()));
                        },
                        child: Text("Log in"),
                      ),
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
