// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

// import '../utils/constants/constants.dart';

// class CustomDatePicker extends StatefulWidget {
//   String label;
//   String placeholder;
//   TextEditingController fieldController;
//   String? Function(String?) handleValidation;

//   IconData? suffixIcon;
//   CustomDatePicker({
//     super.key,
//     required this.label,
//     required this.placeholder,
//     required this.fieldController,
//     required this.handleValidation,
//     this.suffixIcon,
//   });

//   @override
//   State<CustomDatePicker> createState() => _CustomDatePickerState();
// }

// class _CustomDatePickerState extends State<CustomDatePicker> {
//   DateTime _date = DateTime.now();

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           widget.label,
//           style: const TextStyle(
//             fontSize: 16.0,
//             fontWeight: FontWeight.w500,
//             color: kIconColor,
//           ),
//         ),
//         const SizedBox(
//           height: 10.0,
//         ),
//         TextFormField(
//           controller: widget.fieldController,
//           validator: widget.handleValidation,
//           decoration: InputDecoration(
//             hintText: widget.placeholder,
//             suffixIcon: widget.suffixIcon != null
//                 ? IconButton(
//                     onPressed: () {
//                       showDatePicker(
//                         context: context,
//                         initialDate: DateTime.now(),
//                         firstDate: DateTime(2011),
//                         lastDate: DateTime(2025),
//                       ).then((value) {
//                         setState(() {
//                           _date = value!;
//                         });
//                       });
//                     },
//                     icon: Icon(widget.suffixIcon),
//                   )
//                 : null,
//             border: OutlineInputBorder(
//               borderSide: const BorderSide(
//                 width: 1.0,
//                 color: kIconColor,
//               ),
//               borderRadius: BorderRadius.circular(5),
//             ),
//             focusedBorder: OutlineInputBorder(
//               borderSide: const BorderSide(
//                 width: 1.0,
//                 color: kIconColor,
//               ),
//               borderRadius: BorderRadius.circular(5),
//             ),
//           ),
//         ),
//         Text(DateFormat('yyyy-MM-dd').format(_date)),
//       ],
//     );
//     ;
//   }
// }
