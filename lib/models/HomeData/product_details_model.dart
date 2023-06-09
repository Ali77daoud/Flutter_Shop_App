class ProductDetailsModel {
  final Data data;

  ProductDetailsModel({
    required this.data,
  });

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) =>
      ProductDetailsModel(
        data: Data.fromJson(json["data"]),
      );
}

class Data {
  final int id;
  final int price;
  final int oldPrice;
  final int discount;
  final String image;
  final String name;
  final String description;
  final bool inFavorites;
  final bool inCart;
  final List<String> images;

  Data({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
    required this.name,
    required this.description,
    required this.inFavorites,
    required this.inCart,
    required this.images,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        price: json["price"],
        oldPrice: json["old_price"],
        discount: json["discount"],
        image: json["image"],
        name: json["name"],
        description: json["description"],
        inFavorites: json["in_favorites"],
        inCart: json["in_cart"],
        images: List<String>.from(json["images"].map((x) => x)),
      );
}
