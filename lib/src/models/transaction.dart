import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Transaction {
  TransactionType? type;
  String? description;
  String? date;
  String? amount;
  String? currency;

  String get total => type == TransactionType.credit
      ? '+\$${amount ?? '0'}'
      : '-\$${amount ?? '0'}';

  String get humanDate {
    DateTime dateTime = DateTime.tryParse(date ?? '') ?? DateTime.now();
    final DateFormat formatter = DateFormat('d MMM, yyyy | HH:mm');
    return formatter.format(dateTime);
  }

  Transaction({
    this.type,
    this.description,
    this.date,
    this.amount,
    this.currency,
  });

  Transaction.fromJson(Map<String, dynamic> json) {
    type = TransactionType.fromString(json['type']);
    description = json['description'];
    date = json['date'];
    amount = json['amount'];
    currency = json['currency'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type?.value;
    data['description'] = description;
    data['date'] = date;
    data['amount'] = amount;
    data['currency'] = currency;
    return data;
  }
}

enum TransactionType {
  credit('Credit'),
  debit('Debit');

  final String value;
  const TransactionType(this.value);

  Color? get color =>
      this == TransactionType.credit ? Colors.green[900] : Colors.red[900];

  factory TransactionType.fromString(String str) {
    return TransactionType.values.firstWhere(
      (type) => type.value.toLowerCase() == str.toLowerCase(),
      orElse: () => TransactionType.credit,
    );
  }
}
