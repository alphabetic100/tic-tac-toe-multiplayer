import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe_multiplayer/src/features/authentication/log-in/controller/login_loading_controller.dart';
import 'package:tic_tac_toe_multiplayer/src/features/authentication/log-in/controller/login_success_checker.dart';
import 'package:tic_tac_toe_multiplayer/src/features/authentication/sign-up/controller/loading_indicator_controller.dart';
import 'package:tic_tac_toe_multiplayer/src/services/local/local_storage_service.dart';
import 'package:tic_tac_toe_multiplayer/src/services/auth-services/sign_up_service.dart';

class AuthServices {
  final LocalStorageService storageService = LocalStorageService();
  final SignUpService signUpService = SignUpService();
  final LoadingIndicatorController indicatorController =
      Get.put(LoadingIndicatorController());
  final LoginLoadingController loginLoadingController =
      Get.put(LoginLoadingController());
  final LoginSuccessChecker loginSuccessChecker =
      Get.put(LoginSuccessChecker());
  Future<void> signUp({
    required String email,
    required String password,
    required String imagePath,
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
        storageService.saveToken(userUid);
        String? userEmail = userCredential.user!.email;
        signUpService.getAuthData(userUid, userEmail);
        await signUpService.createUserData();
      }
    } on FirebaseAuthException catch (e) {
      indicatorController.isLoading.value = false;
      throw Exception(e.message);
    } catch (e) {
      indicatorController.isLoading.value = false;
      throw Exception("something went wrong! error: $e");
    }
  }

  // Log in service
  Future<void> logInUser(String email, String password) async {
    try {
      loginLoadingController.isLoginLoading.value = true;

      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      String userUid = userCredential.user!.uid;
      storageService.saveToken(userUid);

      String? userEmail = userCredential.user!.email;
      signUpService.getAuthData(
        userUid,
        userEmail,
      );
      signUpService.getAuthData(
        userUid,
        userEmail,
      );
      await storageService.saveToken(userCredential.user!.uid);
      loginSuccessChecker.loginSuccessChecker.value = true;
    } on FirebaseAuthException catch (e) {
      loginSuccessChecker.loginSuccessChecker.value = false;
      throw Exception("something went wrong, error: $e");
    } catch (e) {
      loginSuccessChecker.loginSuccessChecker.value = false;
      throw Exception("something went wrong, error: $e");
    } finally {
      loginLoadingController.isLoginLoading.value = false;
    }
  }
  // upload image to the firestroe database
}
