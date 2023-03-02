// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:voting_system/adminScreen/add_candidate.dart';
// import 'package:voting_system/components/Custom_date_field.dart';
// import 'package:voting_system/components/Custom_voting_textfield.dart';

// import 'package:voting_system/components/custom_textfield.dart';
// import 'package:voting_system/utils/constants/constants.dart';

// class EditPosts extends StatefulWidget {
//   const EditPosts({super.key});

//   @override
//   State<EditPosts> createState() => _EditPostsState();
// }

// class _EditPostsState extends State<EditPosts> {
//   final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

//   final TextEditingController _tittleController = TextEditingController();
//   final TextEditingController _descriptionCOntroller = TextEditingController();
//   final TextEditingController _dateController = TextEditingController();

//   String? titleValidation(String? value) {
//     if (value == null || value.isEmpty || value.trim() == '') {
//       return 'Title validation';
//     }
//     return null;
//   }

//   String? descriptionValidation(String? value) {
//     if (value == null || value.isEmpty || value.trim() == '') {
//       return 'Enter a title';
//     }
//     return null;
//   }

//   String? dateValidation(String? value) {
//     if (value == null || value.isEmpty || value.trim() == '') {
//       return 'Enter description';
//     }
//     return null;
//   }

//   DateTime _date = DateTime.now();
//   bool _isChecked = false;

//   // final TextEditingController _description = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Edit Post"),
//         backgroundColor: allBarColor,
//       ),
//       bottomNavigationBar: BottomAppBar(
//           child: Container(
//         color: allBarColor,
//         height: 50,
//         padding: EdgeInsets.symmetric(horizontal: 20),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             IconButton(
//               onPressed: () {},
//               icon: Icon(
//                 Icons.home,
//                 color: Colors.white,
//                 size: 28,
//               ),
//             ),
//             IconButton(
//               onPressed: () {},
//               icon: Icon(
//                 Icons.person,
//                 color: Colors.white,
//                 size: 28,
//               ),
//             ),
//           ],
//         ),
//       )),
//       body: SafeArea(
//           child: SingleChildScrollView(
//         padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
//         child: Form(
//           key: _formkey,
//           child: Column(children: [
//             CustomTextField(
//               label: "Title",
//               placeholder: "Enter title",
//               fieldController: _tittleController,
//               handleValidation: titleValidation,
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             CustomTextField(
//               label: "Description",
//               placeholder: "Enter descriptiom",
//               fieldController: _descriptionCOntroller,
//               handleValidation: descriptionValidation,
//             ),
//             CustomDatePicker(
//               label: "Start Date",
//               placeholder: "Enter Start Date",
//               fieldController: _dateController,
//               // handleValidation: dateValidation,
//               suffixIcon: Icons.calendar_month_outlined,
//             ),
//             CustomDatePicker(
//               label: "End Date",
//               placeholder: "Enter Start Date",
//               fieldController: _dateController,
//               // handleValidation: dateValidation,

//               suffixIcon: Icons.calendar_month_outlined,
//             ),

//             SizedBox(
//               height: 16,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   "Enabled:",
//                   style: TextStyle(
//                     fontSize: 16.0,
//                     fontWeight: FontWeight.w500,
//                     color: kIconColor,
//                   ),
//                 ),
//                 Checkbox(
//                   value: _isChecked,
//                   onChanged: (value) {
//                     setState(() {
//                       _isChecked = !_isChecked;
//                     });
//                   },
//                 )
//               ],
//             ),
//             SizedBox(
//               height: 16,
//             ),
//             ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.grey.shade200,
//                 foregroundColor: Colors.black54,
//                 minimumSize: Size.fromHeight(50), // NEW
//               ),
//               onPressed: () {
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => AddCandidate(),
//                     ));
//               },
//               child: Text(
//                 "Add Candidates",
//               ),
//             ),
//             SizedBox(
//               height: 16,
//             ),
//             ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: allBarColor,
//                 minimumSize: Size.fromHeight(50), // NEW
//               ),
//               onPressed: () {
//                 _formkey.currentState!.validate();
//               },
//               child: Text("Update Posts"),
//             ) //display
//           ]),
//         ),
//       )),
//     );
//   }
// }


