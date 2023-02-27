import 'package:day_15/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SetName extends StatefulWidget {
  const SetName({super.key});

  @override
  State<SetName> createState() => _SetNameState();
}

class _SetNameState extends State<SetName> {
  @override
  bool isSwitchOn = false;
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: SafeArea(
          child: Container(
        margin: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // TextField(
            //   decoration: InputDecoration(
            //     border: OutlineInputBorder(),
            //     hintText: "Enter Name",
            //     filled: true,
            //     fillColor: Colors.grey.shade300,
            //   ),
            // ),
            TextField(
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9\.]')),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: () {}, child: Text("Confirm")),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ));
                    },
                    child: Text("Cancel"))
              ],
            ),
          ],
        ),
      )),
    );
  }
}
