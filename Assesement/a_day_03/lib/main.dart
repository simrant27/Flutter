import 'package:a_day_03/card.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: CustomCard()));
}

class day03 extends StatelessWidget {
  const day03({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[50],
      appBar: AppBar(
        backgroundColor: Colors.purple[50],
        title: Text(
          "Flutter Bootcamp",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(
                image: NetworkImage(
                  "https://res.cloudinary.com/uktv/image/upload/v1375370891/err4wnmueojcwzrrsucu.jpg",
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text(
                  "Settings",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                // height: 40,
                padding: EdgeInsets.all(15),
                color: Colors.white,
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.person_outline,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            "All Users",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "100+",
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                // height: 40,
                padding: EdgeInsets.all(15),
                color: Colors.white,
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.person_outline,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Employee",
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              "Supoorting our employee Thank you everyo dfjhsdhjfb jhjk",
                              // maxLines: 5,
                              // softWrap: true,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(15),
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.star_border,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Favourite",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          Text("Supporting text"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(15),
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Row(children: [
                  Icon(
                    Icons.email_outlined,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "Emails",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  )
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
