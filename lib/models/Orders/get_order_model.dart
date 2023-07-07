class OrderModel {
  final GetOrderDataModel data;

  OrderModel({
    required this.data,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        data: GetOrderDataModel.fromJson(json["data"]),
      );
}

class GetOrderDataModel {
  final List<Data> data;

  GetOrderDataModel({
    required this.data,
  });

  factory GetOrderDataModel.fromJson(Map<String, dynamic> json) =>
      GetOrderDataModel(
        data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
      );
}

class Data {
  final int id;
  final double total;
  final String date;
  final String status;

  Data({
    required this.id,
    required this.total,
    required this.date,
    required this.status,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        total: json["total"]?.toDouble(),
        date: json["date"],
        status: json["status"],
      );
}
