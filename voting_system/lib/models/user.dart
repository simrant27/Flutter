class User {
  String role;
  bool isEmailVerified;
  String id;
  String name;
  String phone;
  String email;
  String token;

  User(
      {required this.role,
      required this.isEmailVerified,
      required this.id,
      required this.name,
      required this.phone,
      required this.email,
      required this.token});

  static User fromJson(Map<String, dynamic> users) {
    return User(
      role: users['role'],
      isEmailVerified: users['isEmailVerified'],
      id: users['id'],
      name: users['name'],
      phone: users['phone'],
      email: users['email'],
      token: users['token'],
    );
  }
}
