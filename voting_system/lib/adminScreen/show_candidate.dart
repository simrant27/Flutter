import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:voting_system/utils/constants/constants.dart';

class ShowCandidate extends StatefulWidget {
  const ShowCandidate({super.key});

  @override
  State<ShowCandidate> createState() => _ShowCandidateState();
}

class _ShowCandidateState extends State<ShowCandidate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Candidates"),
        centerTitle: true,
        backgroundColor: allBarColor,
      ),
    );
  }
}
