import 'package:agora_shop/models/HomeData/home_data_model.dart';

class SearchProductDataModel {
  final Data data;

  SearchProductDataModel({
    required this.data,
  });

  factory SearchProductDataModel.fromJson(Map<String, dynamic> json) =>
      SearchProductDataModel(
        data: Data.fromJson(json["data"]),
      );
}

class Data {
  final List<Product> products;

  Data({
    required this.products,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        products:
            List<Product>.from(json["data"].map((x) => Product.fromJson(x))),
      );
}
