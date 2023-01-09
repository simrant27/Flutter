import 'package:flutter/material.dart';

void main() {
  runApp(Demo());
}

class Demo extends StatefulWidget {
  const Demo({super.key});

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  int count = 0;
  String appBarTitle = " ";
  Color bgColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appBarTitle),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  count = count - 1;
                });
              },
              icon: Text(
                "-",
                style: TextStyle(
                  fontSize: 26,
                ),
              ),
            )
          ],
        ),
        body: Center(
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // FloatingActionButton(
                //   onPressed: () {},
                // ),
                GestureDetector(
                  onTap: () {
                    print("clicked");

                    setState(() {
                      if (bgColor == Colors.black) {
                        bgColor = Colors.red;
                      } else {
                        bgColor = Colors.black;
                      }
                    });
                  },
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        color: (count % 2 == 0) ? Colors.yellow : Colors.amber,
                        borderRadius: BorderRadius.circular(100)),
                  ),
                ),
                TextField(
                  onChanged: (value) {
                    appBarTitle = value;
                    setState(() {});
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                Text("Count"),
                Text(
                  count.toString(),
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              count = count + 1;
              print(count);
              appBarTitle = "Count is $count";
            });
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
