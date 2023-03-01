import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../utils/constants/constants.dart';

class CustomDatePicker extends StatefulWidget {
  DateTime date;
  String label;
  String placeholder;
  TextEditingController fieldController;
  Function(DateTime dateTime) onChanged;
  // String? Function(String?) handleValidation;

  IconData? suffixIcon;
  CustomDatePicker({
    required this.date,
    super.key,
    required this.label,
    required this.placeholder,
    required this.fieldController,
    required this.onChanged,
    // required this.handleValidation,
    this.suffixIcon,
  });

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  late DateTime _date = widget.date;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 16.0,
        ),
        Text(
          widget.label,
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
            color: kIconColor,
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Container(
          // controller: widget.fieldController,
          // validator: widget.handleValidation,
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                // DateFormat().format(_date),
                DateFormat(DateFormat.YEAR_ABBR_MONTH_DAY).format(_date),
                style: TextStyle(fontSize: 16),
              ),
              IconButton(
                onPressed: () {
                  showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2011),
                    lastDate: DateTime(2025),
                  ).then((value) {
                    setState(() {
                      _date = value!;
                      widget.onChanged(value);
                    });
                  });
                },
                icon: Icon(widget.suffixIcon),
              )
            ],
          ),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black38, width: 1.0),
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ],
    );
    ;
  }
}
