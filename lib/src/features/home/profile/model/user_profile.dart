class UserModel {
  final String createdAt;
  final String email;
  final String fullName;
  final dynamic image;

  UserModel({
    required this.createdAt,
    required this.email,
    required this.fullName,
    this.image,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      createdAt: json['createdAt'] as String,
      email: json['email'] as String,
      fullName: json['fullName'] as String,
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'createdAt': createdAt,
      'email': email,
      'fullName': fullName,
      'image': image,
    };
  }
}
