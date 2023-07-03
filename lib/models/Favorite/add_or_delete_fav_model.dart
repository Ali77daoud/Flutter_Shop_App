class AddOrDeleteFavModel {
  final bool status;
  final String message;

  AddOrDeleteFavModel({
    required this.status,
    required this.message,
  });

  factory AddOrDeleteFavModel.fromJson(Map<String, dynamic> json) =>
      AddOrDeleteFavModel(
        status: json["status"],
        message: json["message"],
      );
}
