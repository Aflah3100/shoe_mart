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
      id: fields[1] as String,
      name: fields[2] as String,
      category: fields[3] as String,
      imageUrl: (fields[4] as List).cast<String>(),
      oldPrice: fields[5] as String,
      sizes: (fields[6] as List).cast<dynamic>(),
      price: fields[7] as String,
      description: fields[8] as String,
      title: fields[9] as String,
      tabIndex: fields[11] as int,
      selectedSize: fields[10] as String,
    )..count = fields[12] as int;
  }

  @override
  void write(BinaryWriter writer, HiveSneakerModel obj) {
    writer
      ..writeByte(12)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.category)
      ..writeByte(4)
      ..write(obj.imageUrl)
      ..writeByte(5)
      ..write(obj.oldPrice)
      ..writeByte(6)
      ..write(obj.sizes)
      ..writeByte(7)
      ..write(obj.price)
      ..writeByte(8)
      ..write(obj.description)
      ..writeByte(9)
      ..write(obj.title)
      ..writeByte(10)
      ..write(obj.selectedSize)
      ..writeByte(11)
      ..write(obj.tabIndex)
      ..writeByte(12)
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
