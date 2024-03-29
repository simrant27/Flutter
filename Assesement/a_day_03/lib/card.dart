import 'package:a_day_03/main.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(color: Colors.white),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  // height: 100,
                  child: Row(
                    // mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Header",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Text(
                              "Subhead",
                              style: TextStyle(
                                fontSize: 22,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Icon(Icons.more_vert),
                    ],
                  ),
                ),
                Image(
                  image: NetworkImage(
                      "https://cdn.shopify.com/s/files/1/0277/5737/9681/products/Samolevsky.com-96Geometricshapesandlogomarkscollection08_740x.jpg?v=1599837765"),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Title",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 30),
                        child: Text(
                          "Subhead",
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                      Text(
                        "Hello everuh gidbusg dghdb dhbd idjksn dhbdb jdbfs kjdbsd dbfjs djbffg df",
                        style: TextStyle(
                          fontSize: 22,
                          wordSpacing: 5,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      OutlinedButton(
                        onPressed: () {
                          print("enabled");
                        },
                        style: ButtonStyle(
                          shape: MaterialStateProperty.resolveWith(
                            (states) => RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          side: MaterialStateProperty.all(
                            BorderSide(
                              color: Colors.black,
                              width: 2,
                            ),
                          ),
                          padding: MaterialStateProperty.resolveWith(
                            (states) => EdgeInsets.symmetric(
                                horizontal: 24, vertical: 16),
                          ),
                        ),
                        child: Text(
                          "Enabled",
                          style: TextStyle(
                            fontSize: 24,
                            color: Color(0xFFB6750a4),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => day03(),
                            ));
                          },
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.resolveWith(
                                (states) => Color(0xFFB6750a4),
                              ),
                              shape: MaterialStateProperty.resolveWith(
                                (states) => RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              padding: MaterialStateProperty.resolveWith(
                                (states) => EdgeInsets.symmetric(
                                    horizontal: 22, vertical: 15),
                              )),
                          child: Text(
                            "Enabled",
                            style: TextStyle(
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
