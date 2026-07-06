class Category {
  final int id;
  final String name;
  final String icon;
  final String color;
  final bool isExpense;

  Category({
    required this.id,
    required this.name,
    required this.icon,
    required this.color,
    required this.isExpense,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'] as int,
      name: json['name'] as String,
      icon: json['icon'] as String,
      color: json['color'] as String,
      isExpense: json['isExpense'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'icon': icon,
      'color': color,
      'isExpense': isExpense,
    };
  }

  Category copyWith(String? name, String? icon, String? color) {
    return Category(
      id: id,
      name: name ?? this.name,
      icon: icon ?? this.icon,
      color: color ?? this.color,
      isExpense: isExpense,
    );
  }
}
