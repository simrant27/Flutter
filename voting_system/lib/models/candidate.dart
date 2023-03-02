class Candidate {
  String id;
  String name;
  String description;
  String votingId;
  int votes;
  String? image;

  Candidate({
    required this.id,
    required this.name,
    required this.description,
    required this.votingId,
    required this.votes,
    this.image,
  });
  static Candidate fromJson(Map<String, dynamic> json) {
    return Candidate(
      id: json['_id'],
      name: json['name'],
      description: json['description'],
      votingId: json['voting'],
      votes: json['votes'],
      image: json['image'],
    );
  }
}
