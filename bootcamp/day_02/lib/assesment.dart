import 'package:flutter/material.dart';

void main() {
  runApp(const Assesment());
}

class Assesment extends StatelessWidget {
  const Assesment({super.key});

  @override
  Widget build(BuildContext context) {
    var smallboxHeight = 100.0;
    var boxWidth = 150.0;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Weather Widgets"),
          centerTitle: true,
          backgroundColor: const Color(0xff637CFF),
        ),
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 50,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(20),
                        margin: const EdgeInsets.all(5),
                        height: smallboxHeight,
                        width: boxWidth,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.grey.withOpacity(0.2),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              offset: const Offset(5, 5),
                              blurRadius: 15,
                              // spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "12 C",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 8.0),
                              child: Text(
                                "CLOUDY DAY",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(15),
                        margin: const EdgeInsets.all(5),
                        height: smallboxHeight,
                        width: boxWidth,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.grey.withOpacity(0.2),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              offset: const Offset(5, 5),
                              blurRadius: 15,
                              // spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Alarm",
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: const [
                                  Text(
                                    "11:45",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 5),
                                    child: Text(
                                      "AM",
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: const [
                                Text("M "),
                                Text("T "),
                                Text(
                                  "W ",
                                  style: TextStyle(
                                      decoration: TextDecoration.underline),
                                ),
                                Text("T "),
                                Text(
                                  "F ",
                                  style: TextStyle(
                                      decoration: TextDecoration.underline),
                                ),
                                Text("S "),
                                Text("S "),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 25),
                        margin: const EdgeInsets.all(10),
                        height: 2 * smallboxHeight + 8,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.grey.withOpacity(0.2),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              offset: const Offset(5, 5),
                              blurRadius: 15,
                              // spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Text(
                              "22",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "..",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "56",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "TUE,03 MAY,2022",
                                style: TextStyle(
                                  fontSize: 15,
                                  // fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Text(
                              "RAY",
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
