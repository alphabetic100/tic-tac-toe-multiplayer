bool isEmailPasswordValid(String email, String password) {
  final emailRegex = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+$");
  bool isPasswordValid = password.length >= 8;

  return emailRegex.hasMatch(email) && isPasswordValid;
}
