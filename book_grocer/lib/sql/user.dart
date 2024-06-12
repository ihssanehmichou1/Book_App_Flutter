class User {
  final int? id;
  final String name;
  final String email;
  final String mobile;
  final String code; // Ajout du champ code
  final String password;

  User({
    this.id,
    required this.name,
    required this.email,
    required this.mobile,
    required this.code,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'mobile': mobile,
      'code': code,
      'password': password,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      mobile: map['mobile'],
      code: map['code'],
      password: map['password'],
    );
  }
}
