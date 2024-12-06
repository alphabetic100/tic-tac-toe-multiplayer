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

      await userCredential.user?.updateDisplayName(fullName);
      await userCredential.user!.reload();
    } on FirebaseAuthException catch (e) {
      Get.defaultDialog(title: "Allert", middleText: e.message.toString());
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e);
    }
  }
}
