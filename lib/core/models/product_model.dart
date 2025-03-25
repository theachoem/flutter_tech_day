class ProductModel {
  final int? id;
  final String? title;
  final double? price;
  final String? description;
  final String? image;

  ProductModel({
    this.id,
    this.title,
    this.price,
    this.description,
    this.image,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        title: json["title"],
        price: json["price"]?.toDouble(),
        description: json["description"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "image": image,
      };
}
