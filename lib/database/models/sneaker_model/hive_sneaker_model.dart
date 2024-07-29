import 'package:hive_flutter/hive_flutter.dart';
part 'hive_sneaker_model.g.dart';

@HiveType(typeId: 0)
class HiveSneakerModel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String category;
  @HiveField(3)
  final String price;
  @HiveField(4)
  final String size;
  @HiveField(5)
  final String imageUrl;
  @HiveField(6)
  int count = 1;

  HiveSneakerModel(
      {required this.id,
      required this.name,
      required this.category,
      required this.price,
      required this.size,
      required this.imageUrl});
}
