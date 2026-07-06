class Transaction {
  final int id;
  final int categoryId;
  final String amount;
  final String unit;
  final String date;
  final String comment;
  final bool isExpense;

  Transaction({
    required this.id,
    required this.categoryId,
    required this.amount,
    required this.unit,
    required this.date,
    required this.comment,
    required this.isExpense,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      id: json['id'] as int,
      categoryId: json['categoryId'] as int,
      amount: json['amount'] as String,
      unit: json['unit'] as String,
      date: json['date'] as String,
      comment: json['comment'] as String,
      isExpense: json['isExpense'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'categoryId': categoryId,
      'amount': amount,
      'unit': unit,
      'date': date,
      'comment': comment,
      'isExpense': isExpense,
    };
  }

  Transaction copyWith({
    int? id,
    int? categoryId,
    String? amount,
    String? unit,
    String? date,
    String? comment,
    bool? isExpense,
  }) {
    return Transaction(
      id: id ?? this.id,
      categoryId: categoryId ?? this.categoryId,
      amount: amount ?? this.amount,
      unit: unit ?? this.unit,
      date: date ?? this.date,
      comment: comment ?? this.comment,
      isExpense: isExpense ?? this.isExpense,
    );
  }
}
