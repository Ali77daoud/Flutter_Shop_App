class HomeDataModel {
  final Data data;

  HomeDataModel({
    required this.data,
  });

  factory HomeDataModel.fromJson(Map<String, dynamic> json) => HomeDataModel(
        data: Data.fromJson(json["data"]),
      );
}

class Data {
  final List<Banner> banners;
  final List<Product> products;
  final String ad;

  Data({
    required this.banners,
    required this.products,
    required this.ad,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        banners:
            List<Banner>.from(json["banners"].map((x) => Banner.fromJson(x))),
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
        ad: json["ad"],
      );
}

class Banner {
  final int id;
  final String image;
  final Category? category;
  final dynamic product;

  Banner({
    required this.id,
    required this.image,
    this.category,
    this.product,
  });

  factory Banner.fromJson(Map<String, dynamic> json) => Banner(
        id: json["id"],
        image: json["image"],
        category: json["category"] == null
            ? null
            : Category.fromJson(json["category"]),
        product: json["product"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "category": category?.toJson(),
        "product": product,
      };
}

class Category {
  final int id;
  final String image;
  final String name;

  Category({
    required this.id,
    required this.image,
    required this.name,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        image: json["image"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "name": name,
      };
}

class Product {
  final int id;
  final double price;
  final double oldPrice;
  final int discount;
  final String image;
  final String name;
  final String description;
  final List<String> images;
  final bool inFavorites;
  final bool inCart;

  Product({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
    required this.name,
    required this.description,
    required this.images,
    required this.inFavorites,
    required this.inCart,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        price: json["price"]?.toDouble(),
        oldPrice: json["old_price"]?.toDouble(),
        discount: json["discount"],
        image: json["image"],
        name: json["name"],
        description: json["description"],
        images: List<String>.from(json["images"].map((x) => x)),
        inFavorites: json["in_favorites"],
        inCart: json["in_cart"],
      );
}
