import 'package:day_15/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SetFontSize extends StatefulWidget {
  const SetFontSize({super.key});

  @override
  State<SetFontSize> createState() => _SetFontSizeState();
}

class _SetFontSizeState extends State<SetFontSize> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: Container(
        margin: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter Font Size",
                filled: true,
                fillColor: Colors.grey.shade300,
              ),
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
