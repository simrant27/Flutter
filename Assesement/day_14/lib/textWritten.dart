import 'package:flutter/material.dart';

// class TextWritten extends StatelessWidget {
//   const TextWritten({
//     Key? key,
//     required TextEditingController textEntered,
//   })  : _textEntered = textEntered,
//         super(key: key);

//   final TextEditingController _textEntered;

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Container(
//         color: Colors.purple.shade100,
//         child: Center(child: Text(_textEntered.text)),
//       ),
//     );
//   }
// }

class TextWritten extends StatelessWidget {
  String textToShow = "";
  bool SwitchOn;
  TextWritten({super.key, required this.textToShow, required this.SwitchOn});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: SwitchOn ? Colors.white : Colors.purple.shade100,
        child: Center(child: Text(textToShow)),
      ),
    );
  }
}
