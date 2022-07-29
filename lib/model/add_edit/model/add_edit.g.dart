// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_edit.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TransationModelAdapter extends TypeAdapter<TransationModel> {
  @override
  final int typeId = 1;

  @override
  TransationModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TransationModel(
      id: fields[0] as String,
      notes: fields[1] as String,
      amount: fields[2] as double,
      dateTime: fields[3] as DateTime,
      type: fields[4] as CategoryType,
    );
  }

  @override
  void write(BinaryWriter writer, TransationModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.notes)
      ..writeByte(2)
      ..write(obj.amount)
      ..writeByte(3)
      ..write(obj.dateTime)
      ..writeByte(4)
      ..write(obj.type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TransationModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CategoryTypeAdapter extends TypeAdapter<CategoryType> {
  @override
  final int typeId = 2;

  @override
  CategoryType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return CategoryType.income;
      case 1:
        return CategoryType.expense;
      case 2:
        return CategoryType.borrow;
      case 3:
        return CategoryType.lend;
      default:
        return CategoryType.income;
    }
  }

  @override
  void write(BinaryWriter writer, CategoryType obj) {
    switch (obj) {
      case CategoryType.income:
        writer.writeByte(0);
        break;
      case CategoryType.expense:
        writer.writeByte(1);
        break;
      case CategoryType.borrow:
        writer.writeByte(2);
        break;
      case CategoryType.lend:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
