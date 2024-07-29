import 'package:hive_flutter/hive_flutter.dart';
part 'hive_sneaker_model.g.dart';

@HiveType(typeId: 0)
class HiveSneakerModel {
  @HiveField(1)
  final String id;
  @HiveField(2)
  final String name;
  @HiveField(3)
  final String category;
  @HiveField(4)
  final List<String> imageUrl;
  @HiveField(5)
  final String oldPrice;
  @HiveField(6)
  final List<dynamic> sizes;
  @HiveField(7)
  final String price;
  @HiveField(8)
  final String description;
  @HiveField(9)
  final String title;
  @HiveField(10)
  final String selectedSize;
  @HiveField(11)
  final int tabIndex;

  @HiveField(12)
  int count = 1;

  HiveSneakerModel(
      {required this.id,
      required this.name,
      required this.category,
      required this.imageUrl,
      required this.oldPrice,
      required this.sizes,
      required this.price,
      required this.description,
      required this.title,
      required this.tabIndex,
      required this.selectedSize});
}
