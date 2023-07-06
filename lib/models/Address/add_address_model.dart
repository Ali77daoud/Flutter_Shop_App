class AddAddressModel {
  final bool status;
  final String message;
  final AddressData data;

  AddAddressModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory AddAddressModel.fromJson(Map<String, dynamic> json) =>
      AddAddressModel(
        status: json["status"],
        message: json["message"],
        data: AddressData.fromJson(json["data"]),
      );
}

class AddressData {
  final String name;
  final String city;
  final String region;
  final String details;
  final String notes;
  final String latitude;
  final String longitude;

  AddressData({
    required this.name,
    required this.city,
    required this.region,
    required this.details,
    required this.notes,
    required this.latitude,
    required this.longitude,
  });

  factory AddressData.fromJson(Map<String, dynamic> json) => AddressData(
        name: json["name"],
        city: json["city"],
        region: json["region"],
        details: json["details"],
        notes: json["notes"],
        latitude: json["latitude"],
        longitude: json["longitude"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "city": city,
        "region": region,
        "details": details,
        "notes": notes,
        "latitude": latitude,
        "longitude": longitude,
      };
}
