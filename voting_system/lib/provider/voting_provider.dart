import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../models/candidate.dart';
import '../models/voting.dart';
import '../utils/constants/constants.dart';

class VotingProvider with ChangeNotifier {
  String accessToken = '';
  List<Voting> votings = [];

  VotingProvider() {
    init();
  }
  Future<void> getAuthToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    accessToken = prefs.getString('accessToken') ?? '';
  }

  void setVoting(Voting voting) {
    int foundIndex = -1;
    for (int i = 0; i < votings.length; i++) {
      if (votings[i].id == voting.id) {
        // foundIndex = 1
        foundIndex = i;
        break;
      }
    }
    if (foundIndex == -1) {
      votings.add(voting);
    } else {
      votings[foundIndex] = voting;
    }
    notifyListeners();
  }

  void deleteVoting(Voting voting) {
    int foundIndex = -1;
    for (int i = 0; i < votings.length; i++) {
      if (votings[i].id == voting.id) {
        foundIndex = i;
      }
    }
    if (foundIndex != -1) {
      votings.removeAt(foundIndex);
    }
    notifyListeners();
  }

  void addCandiate(Candidate candidateToAdd) {
    int foundIndex = -1;
    for (int i = 0; i < votings.length; i++) {
      if (votings[i].id == candidateToAdd.votingId) {
        foundIndex = i;
      }
    }
    if (foundIndex == -1) throw Exception("Voting not found");

    votings[foundIndex].candidates.add(candidateToAdd);

    notifyListeners();
  }

  void init() async {
    await getAuthToken();
    await fetchAllVotings();
  }

  Future<void> fetchAllVotings() async {
    var response = await http.get(Uri.parse("$baseURL/votings"), headers: {
      "Authorization": "Bearer $accessToken",
    });
    var jsonDecodedResponse = jsonDecode(response.body);
    if (jsonDecodedResponse['status'] == "success") {
      var rawVotings = jsonDecodedResponse['data'];
      for (int i = 0; i < rawVotings.length; i++) {
        Voting parsedVoting = Voting.fromJson(rawVotings[i]);
        votings.add(parsedVoting);
      }
    } else {
      print("Somting bad happened. ${response.body}");
    }
    notifyListeners();
  }
}
