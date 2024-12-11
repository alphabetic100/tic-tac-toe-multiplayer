import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe_multiplayer/src/core/constants/const_values.dart';
import 'package:tic_tac_toe_multiplayer/src/features/authentication/presentation/sign-up/controller/loading_indicator_controller.dart';
import 'package:tic_tac_toe_multiplayer/src/features/authentication/presentation/sign-up/values/sign_in_values.dart';
import 'package:tic_tac_toe_multiplayer/src/services/model/create_user_data_model.dart';

class SignUpService {
  final CreateUserDataModel userDataModel = CreateUserDataModel();
  final LoadingIndicatorController indicatorController =
      Get.put(LoadingIndicatorController());
  String _userUid = "";
  String _userEmail = "";

  createUserData() async {
    if (_userUid.isNotEmpty) {
      try {
        indicatorController.isLoading.value = true;
        await FirebaseFirestore.instance
            .collection(users)
            .doc(_userUid)
            .set(userDataModel.createUser(fullName, _userEmail, ""));
      } catch (e) {
        throw Exception("something went wrong! error: $e");
      } finally {
        indicatorController.isLoading.value = false;
      }
    }
  }

  getAuthData(String userUid, String? email) async {
    _userUid = userUid;
    _userEmail = email ?? "";
  }
}
