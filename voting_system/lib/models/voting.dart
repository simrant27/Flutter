import 'package:voting_system/models/candidate.dart';
import 'package:voting_system/utils/constants/candidates.dart';

class Voting {
  String id;
  String title;
  String description;
  String status;
  DateTime from;
  DateTime to;

  List<Candidate> candidates = [];
  // String token;
  Voting({
    required this.id,
    required this.title,
    required this.description,
    required this.status,
    required this.from,
    required this.to,
    required this.candidates,
    // required this.token
  });

  static Voting fromJson(Map<String, dynamic> json) {
    List<Candidate> includedCandidates = [];
    if (json.containsKey("candidates")) {
      for (int i = 0; i < json["candidates"].length; i++) {
        Candidate parsed = Candidate.fromJson(json["candidates"][i]);
        includedCandidates.add(parsed);
      }
    }

    return Voting(
      id: json['_id'],
      candidates: includedCandidates,
      title: json['title'],
      description: json['description'],
      status: json['status'],
      from: DateTime.parse(json['from']),
      to: DateTime.parse(json['to']),
      // token: json['token']
    );
  }
}
