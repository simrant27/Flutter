// import 'package:flutter/cupertino.dart';
// import 'package:voting_system/models/candidate.dart';

// class CandidateProvider with ChangeNotifier {
//   List<Candidate> candidates = [];

//   void editCandidate(Candidate candidate) {
//     int foundIndex = -1;
//     for (int i = 0; i < candidates.length; i++) {
//       if (candidates[i].id == candidate.id) {
//         foundIndex = i;
//       }
//     }
//     if (foundIndex == -1) {
//       candidates.add(candidate);
//     } else {
//       candidates[foundIndex] = candidate;
//     }
//     notifyListeners();
//   }

//   void deleteCandidate(Candidate candidate) {
//     int foundIndex = -1;
//     for (int i = 0; i < candidates.length; i++) {
//       if (candidates[i].id == candidate.id) {
//         foundIndex = i;
//       }
//     }
//     if (foundIndex != -1) {
//       candidates.removeAt(foundIndex);
//     }
//     notifyListeners();
//   }
// }
