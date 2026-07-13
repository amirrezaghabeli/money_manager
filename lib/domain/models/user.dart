class User {
  final String name;
  final String password;

  User({required this.name, required this.password});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'] as String,
      password: json['password'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{'name': name, 'password': password};
  }

  User copyWith({int? id, String? name, String? password}) {
    return User(name: name ?? this.name, password: password ?? this.password);
  }
}
