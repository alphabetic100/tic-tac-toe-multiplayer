import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe_multiplayer/src/features/authentication/presentation/sign-up/controller/loading_indicator_controller.dart';
import 'package:tic_tac_toe_multiplayer/src/services/auth-services/sign_up_service.dart';

class AuthServices {
  final SignUpService signUpService = SignUpService();
  final LoadingIndicatorController indicatorController =
      Get.put(LoadingIndicatorController());
  Future<void> signUp({
    required String email,
    required String password,
  }) async {
    try {
      indicatorController.isLoading.value = true;
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user != null) {
        String userUid = userCredential.user!.uid;
        String? userEmail = userCredential.user!.email;
        signUpService.getAuthData(userUid, userEmail);
        await signUpService.createUserData();
      }
    } on FirebaseAuthException catch (e) {
      indicatorController.isLoading.value = false;
      throw Exception(e.message);
      // AlertDialog(
      //   title: const Text("Error"),
      //   content: Text(e.message ?? "An unknown error occurred"),
      //   actions: [
      //     TextButton(
      //       onPressed: () {
      //         Get.back();
      //       },
      //       child: const Text("OK"),
      //     ),
      //   ],
      // );
    } catch (e) {
      indicatorController.isLoading.value = false;
      throw Exception("something went wrong! error: $e");
      // AlertDialog(
      //   title: const Text("Error"),
      //   content: const Text("Something went wrong!"),
      //   actions: [
      //     TextButton(
      //       onPressed: () {
      //         Get.back();
      //       },
      //       child: const Text("OK"),
      //     ),
      //   ],
      // );
    }
  }
}
