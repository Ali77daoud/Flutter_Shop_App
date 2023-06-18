class UpdateProfileModel {
  final String name;
  final String email;
  final String phone;
  final String img;

  UpdateProfileModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.img,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'image': img,
    };
  }
}
