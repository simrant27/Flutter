import 'package:flutter/material.dart';

class Multiply extends StatelessWidget {
  int numb;
  Multiply({super.key, required this.numb});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade100,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text("Multiplication Table of ${numb}"),
      ),
      body: Center(
          child: Container(
        width: MediaQuery.of(context).size.width * 0.5,
        height: MediaQuery.of(context).size.height * 0.5,
        decoration: BoxDecoration(
            color: Colors.purple.shade100,
            boxShadow: [
              BoxShadow(
                offset: Offset(10, 10),
                color: Colors.purple.shade200,
              )
            ],
            borderRadius: BorderRadius.circular(48)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (var i = 1; i <= 10; i++)
              Text(
                "$numb * $i = ${numb * i}",
                style: TextStyle(fontSize: 24),
              ),
          ],
        ),
      )),
    );
  }
}
