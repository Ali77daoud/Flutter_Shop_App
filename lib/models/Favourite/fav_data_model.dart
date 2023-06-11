class FavDataModel {
  final Data data;

  FavDataModel({
    required this.data,
  });

  factory FavDataModel.fromJson(Map<String, dynamic> json) => FavDataModel(
        data: Data.fromJson(json["data"]),
      );
}

class Data {
  final List<Datum> data;

  Data({
    required this.data,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );
}

class Datum {
  final int id;
  final Product product;

  Datum({
    required this.id,
    required this.product,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        product: Product.fromJson(json["product"]),
      );
}

class Product {
  final int id;
  final int price;
  final int oldPrice;
  final int discount;
  final String image;
  final String name;
  final String description;

  Product({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
    required this.name,
    required this.description,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        price: json["price"],
        oldPrice: json["old_price"],
        discount: json["discount"],
        image: json["image"],
        name: json["name"],
        description: json["description"],
      );
}
