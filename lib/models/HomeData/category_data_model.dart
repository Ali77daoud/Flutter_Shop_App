class CategoryDataModel {
  final Data data;
  CategoryDataModel({
    required this.data,
  });

  factory CategoryDataModel.fromJson(Map<String, dynamic> json) =>
      CategoryDataModel(
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
  final String name;
  final String image;

  Datum({
    required this.id,
    required this.name,
    required this.image,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        image: json["image"],
      );
}
