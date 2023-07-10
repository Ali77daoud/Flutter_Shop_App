class GetOrderDetailsModel {
  final GetOrderDetailsDataModel data;

  GetOrderDetailsModel({
    required this.data,
  });

  factory GetOrderDetailsModel.fromJson(Map<String, dynamic> json) =>
      GetOrderDetailsModel(
        data: GetOrderDetailsDataModel.fromJson(json["data"]),
      );
}

class GetOrderDetailsDataModel {
  final int id;
  final dynamic cost;
  final dynamic vat;
  final dynamic total;
  final String paymentMethod;
  final String date;
  final String status;
  final Address address;
  final List<Product> products;

  GetOrderDetailsDataModel({
    required this.id,
    required this.cost,
    required this.vat,
    required this.total,
    required this.paymentMethod,
    required this.date,
    required this.status,
    required this.address,
    required this.products,
  });

  factory GetOrderDetailsDataModel.fromJson(Map<String, dynamic> json) =>
      GetOrderDetailsDataModel(
        id: json["id"],
        cost: json["cost"],
        vat: json["vat"],
        total: json["total"],
        paymentMethod: json["payment_method"],
        date: json["date"],
        status: json["status"],
        address: Address.fromJson(json["address"]),
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
      );
}

class Address {
  final int id;
  final String name;
  final String city;
  final String region;
  final String details;
  final String notes;
  final dynamic latitude;
  final dynamic longitude;

  Address({
    required this.id,
    required this.name,
    required this.city,
    required this.region,
    required this.details,
    required this.notes,
    required this.latitude,
    required this.longitude,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        id: json["id"],
        name: json["name"],
        city: json["city"],
        region: json["region"],
        details: json["details"],
        notes: json["notes"],
        latitude: json["latitude"],
        longitude: json["longitude"],
      );
}

class Product {
  final int id;
  final int quantity;
  final dynamic price;
  final String name;
  final String image;

  Product({
    required this.id,
    required this.quantity,
    required this.price,
    required this.name,
    required this.image,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        quantity: json["quantity"],
        price: json["price"],
        name: json["name"],
        image: json["image"],
      );
}
