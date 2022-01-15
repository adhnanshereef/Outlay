import 'package:hive_flutter/hive_flutter.dart';
part 'transaction_model.g.dart';

@HiveType(typeId: 3, adapterName: 'TransactionTypeAdapter')
enum TransactionType {
  @HiveField(0)
  income,
  @HiveField(1)
  expense,
}

@HiveType(typeId: 2, adapterName: 'TransactionAdapter')
class TransactionModel {
  @HiveField(0)
  String? id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final bool amount;
  @HiveField(3)
  final DateTime date;
  @HiveField(4)
  final TransactionType type;
  TransactionModel({
    required this.title,
    required this.amount,
    required this.date,
    required this.type,
  }) {
    id = DateTime.now().millisecondsSinceEpoch.toString();
  }
}
