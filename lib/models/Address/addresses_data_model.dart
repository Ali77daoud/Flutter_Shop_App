class AddressesDataModel {
  final Data data;

  AddressesDataModel({
    required this.data,
  });

  factory AddressesDataModel.fromJson(Map<String, dynamic> json) =>
      AddressesDataModel(
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
  final String city;
  final String region;
  final String details;
  final String notes;
  final double latitude;
  final double longitude;

  Datum({
    required this.id,
    required this.name,
    required this.city,
    required this.region,
    required this.details,
    required this.notes,
    required this.latitude,
    required this.longitude,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        city: json["city"],
        region: json["region"],
        details: json["details"],
        notes: json["notes"],
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
      );
}
