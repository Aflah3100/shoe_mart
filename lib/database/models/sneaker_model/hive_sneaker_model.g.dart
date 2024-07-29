// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_sneaker_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveSneakerModelAdapter extends TypeAdapter<HiveSneakerModel> {
  @override
  final int typeId = 0;

  @override
  HiveSneakerModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveSneakerModel(
      id: fields[0] as String,
      name: fields[1] as String,
      category: fields[2] as String,
      price: fields[3] as String,
      size: fields[4] as String,
      imageUrl: fields[5] as String,
    )..count = fields[6] as int;
  }

  @override
  void write(BinaryWriter writer, HiveSneakerModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.category)
      ..writeByte(3)
      ..write(obj.price)
      ..writeByte(4)
      ..write(obj.size)
      ..writeByte(5)
      ..write(obj.imageUrl)
      ..writeByte(6)
      ..write(obj.count);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveSneakerModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
