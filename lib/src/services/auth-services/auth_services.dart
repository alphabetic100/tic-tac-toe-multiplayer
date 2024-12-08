import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthServices {
  Future<void> signUp({
    required String fullName,
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user != null) {
        // User creation succeeded
      }
    } on FirebaseAuthException catch (e) {
      // Ensure the dialog shows the error
      Get.defaultDialog(
        title: "Alert",
        middleText: e.message ?? "An unknown error occurred",
      );
    } catch (e) {
      // Handle any other exceptions
      Get.defaultDialog(
        title: "Error",
        middleText: e.toString(),
      );
    }
  }
}
