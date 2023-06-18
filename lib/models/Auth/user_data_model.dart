class UserModel {
  final String message;
  final UserDataModel data;

  UserModel({required this.message, required this.data});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        message: json['message'], data: UserDataModel.fromJson(json['data']));
  }
}

class UserDataModel {
  final int id;
  final String name, email, phone, image, token;

  UserDataModel(
      {required this.id,
      required this.name,
      required this.email,
      required this.phone,
      required this.image,
      required this.token});

  factory UserDataModel.fromJson(Map<String, dynamic> json) {
    return UserDataModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      image: json['image'],
      token: json['token'],
    );
  }
}
