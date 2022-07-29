import 'package:hive_flutter/hive_flutter.dart';
part 'add_edit.g.dart';

@HiveType(typeId: 2)
enum CategoryType {
  @HiveField(0)
  income,
  @HiveField(1)
  expense,
  @HiveField(2)
  borrow,
  @HiveField(3)
  lend,
}

@HiveType(typeId: 1)
class TransationModel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String notes;
  @HiveField(2)
  final double amount;
  @HiveField(3)
  final DateTime dateTime;
  @HiveField(4)
  final CategoryType type;

  TransationModel({
    required this.id,
    required this.notes,
    required this.amount,
    required this.dateTime,
    required this.type,
  });
}
