class SneakerModel {
  SneakerModel({
    required this.id,
    required this.name,
    required this.category,
    required this.imageUrl,
    required this.oldPrice,
    required this.sizes,
    required this.price,
    required this.description,
    required this.title,
  });

  final String? id;
  final String? name;
  final String? category;
  final List<String> imageUrl;
  final String? oldPrice;
  final List<dynamic> sizes;
  final String? price;
  final String? description;
  final String? title;

  factory SneakerModel.fromJson(Map<String, dynamic> json) {
    return SneakerModel(
      id: json["id"],
      name: json["name"],
      category: json["category"],
      imageUrl: json["imageUrl"] == null
          ? []
          : List<String>.from(json["imageUrl"]!.map((x) => x)),
      oldPrice: json["oldPrice"],
      sizes: json["sizes"] == null
          ? []
          : List<dynamic>.from(json["sizes"]!.map((x) => x)),
      price: json["price"],
      description: json["description"],
      title: json["title"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "category": category,
        "imageUrl": imageUrl.map((x) => x).toList(),
        "oldPrice": oldPrice,
        "sizes": sizes.map((x) => x.toJson()).toList(),
        "price": price,
        "description": description,
        "title": title,
      };
}
