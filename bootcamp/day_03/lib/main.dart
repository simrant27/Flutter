import 'package:flutter/material.dart';

void main() {
  runApp(const Day03());
}

class Day03 extends StatelessWidget {
  const Day03({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // appBar: AppBar(),
        body: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    print("clicked");
                  },
                  splashColor: Colors.amber,
                  child: Row(
                    children: [
                      const Text(
                        "Hello",
                        style: TextStyle(fontSize: 25),
                      ),
                      const Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                      const Icon(Icons.access_alarm_rounded),
                      const Icon(Icons.account_circle_rounded),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: ElevatedButton(
                          onPressed: () {
                            print("Button clicked");
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.resolveWith(
                                (states) => Colors.red),
                            padding: MaterialStateProperty.resolveWith(
                              (states) => const EdgeInsets.all(15),
                            ),
                            shape: MaterialStateProperty.resolveWith(
                              (states) => RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                                side: BorderSide(color: Colors.black, width: 5),
                              ),
                            ),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.auto_fix_normal_sharp),
                              const Text("hello"),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),

                Container(
                  height: 500,
                  width: 500,
                  margin: const EdgeInsets.only(top: 50),
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage(
                      "assets/cat.jpg",
                    ),
                    fit: BoxFit.cover,
                  )),
                ),
                const SizedBox(
                  height: 40,
                ),
                const Image(
                  image: AssetImage(
                    "assets/cat.jpg",
                  ),
                  height: 400,
                ),
                // Image.network(
                //     "https://cdn.vox-cdn.com/thumbor/yeki5aYDqyCPxdg1rrypBknrnLw=/0x0:1004x753/1220x813/filters:focal(422x296:582x456):format(webp)/cdn.vox-cdn.com/uploads/chorus_image/image/63710251/20150428-cloud-computing.0.1489222360.0.jpg"),
                const Image(
                  image: NetworkImage(
                      "https://cdn.vox-cdn.com/thumbor/yeki5aYDqyCPxdg1rrypBknrnLw=/0x0:1004x753/1220x813/filters:focal(422x296:582x456):format(webp)/cdn.vox-cdn.com/uploads/chorus_image/image/63710251/20150428-cloud-computing.0.1489222360.0.jpg"),
                  width: 500,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
