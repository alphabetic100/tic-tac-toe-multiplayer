class CreateUserDataModel {
  Map<String, dynamic> createUser(
      String fullName, String email, String image) {
    return {
      'fullName': fullName,
      'email': email,
      'image': image,
      'createdAt': DateTime.now().toIso8601String(),
    };
  }
}
