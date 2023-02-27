import 'package:day_15/set_bg_color.dart';
import 'package:day_15/set_font_size.dart';
import 'package:day_15/set_name.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  bool isSwitchOn = false;

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Text(
              "Hello \n<Name>",
              style: TextStyle(fontSize: 56),
            )),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => SetFontSize(),
                  ));
                },
                child: Text("Set Font Size")),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => SetName(),
                  ));
                },
                child: Text("Set Name")),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => SetBgColor(
                            istoggledOn: (v) {
                              isSwitchOn = v;
                            },
                          )));
                },
                child: Text("Set BG color")),

            // Container(
            //   child: Column(
            //     children: [

            //     ],
            //   ),
            // )
          ],
        ),
      ),
      backgroundColor: isSwitchOn ? Colors.red : Colors.amber,
    );
  }
}
