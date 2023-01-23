import 'package:flutter/material.dart';

void main() {
  runApp(Todo_list());
}

class Todo_list extends StatefulWidget {
  const Todo_list({super.key});

  @override
  State<Todo_list> createState() => _Todo_listState();
}

class _Todo_listState extends State<Todo_list> {
  Color iconColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          title: Text("To Do List"),
          // centerTitle: true,
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              Stack(
                textDirection: TextDirection.rtl,
                children: [
                  Container(
                    child: Image.asset("assets/me.jpg"),
                  ),
                  Text(
                    "hello",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              ListTile(
                leading: Icon(Icons.edit),
                title: Text("Edit Task"),
                subtitle: Text("All Task"),
              ),
              ListTile(
                leading: Icon(Icons.file_copy),
                title: Text("Search"),
                subtitle: Text("All Task"),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text("Settings"),
                subtitle: Text("Select your preference"),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.blueGrey,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    iconColor = Colors.amber;
                  });
                },
                icon: Icon(
                  Icons.home,
                  color: iconColor,
                ),
              ),
              IconButton(
                onPressed: () {
                  // print("Clicked");
                  setState(() {
                    iconColor = Colors.amber;
                  });
                },
                icon: Icon(
                  Icons.calendar_month,
                  color: iconColor,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.card_travel_sharp,
                  color: Colors.white,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // txtField = TextField(
            //   decoration: InputDecoration(
            //     border: OutlineInputBorder(
            //       borderSide: BorderSide(),
            //     ),
            //   ),
            // );
          },
          child: Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  height: 150,
                  width: 1000,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey.shade300,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(2, 3),
                        blurRadius: 5,
                        color: Colors.blueGrey.shade300,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      // Image.network(
                      //     "https://img.favpng.com/9/7/0/clock-watch-icon-png-favpng-0m5Pvk2XcbsJqnEiYY8V8p2dS.jpg");
                      Text(
                        "Manage your \n Time Well",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          // color: Colors.red,
                          // width: 5,
                          ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Clear All",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.redAccent,
                        ),
                      ),
                    ),
                  ],
                ),
                // Container(
                //   child: ListView.builder(
                //     itemCount: 5,
                //     itemBuilder: (context, i) {
                //       return ListTile();
                //     },
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
