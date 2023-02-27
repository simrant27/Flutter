import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:voting_app/authentication/register.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _forEmail = TextEditingController();
  TextEditingController _forPassword = TextEditingController();

  bool isCheckboxOn = false;
  bool hidePassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(top: 120, left: 20, right: 20),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Login",
                    style: TextStyle(fontSize: 32),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text("Email"),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.length == 0) {
                        return "Enter your email";
                      }
                      return null;
                    },
                    controller: _forEmail,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(5),
                      prefixIcon: Icon(Icons.email_outlined),
                      border: OutlineInputBorder(),
                      hintText: "Your email",
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text("Password"),
                  TextFormField(
                    obscureText: hidePassword,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.length == 0) {
                        return "Enter your password";
                      }
                      return null;
                    },
                    controller: _forPassword,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(5),
                      prefixIcon: Icon(Icons.lock_outlined),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            hidePassword = !hidePassword;
                          });
                        },
                        icon: Icon(
                          hidePassword
                              ? (Icons.visibility_off)
                              : (Icons.visibility),
                        ),
                      ),
                      border: OutlineInputBorder(),
                      hintText: "Your Password",
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        Checkbox(
                          value: isCheckboxOn,
                          onChanged: (value) {
                            setState(() {
                              isCheckboxOn = value!;
                            });
                          },
                        ),
                        Text("Remember Me"),
                      ]),
                      TextButton(
                        onPressed: () {},
                        child: Text("Forget Password?"),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.purple.shade200,
                          ),
                          onPressed: () {
                            _formKey.currentState!.validate();
                          },
                          child: Text("Login"),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Dont have an account?"),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Signin()));
                          },
                          child: Text("Sign up"))
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
