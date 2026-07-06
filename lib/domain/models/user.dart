class User {
  final int id;
  final String name;
  final String password;

  User({required this.id, required this.name, required this.password});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,
      name: json['name'] as String,
      password: json['password'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{'id': id, 'name': name, 'password': password};
  }

  User copyWith({int? id, String? name, String? password}) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      password: password ?? this.password,
    );
  }
}
