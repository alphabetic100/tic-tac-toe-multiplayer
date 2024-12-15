import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe_multiplayer/src/core/constants/const_values.dart';
import 'package:tic_tac_toe_multiplayer/src/features/home/profile/controller/profile_data_controller.dart';
import 'package:tic_tac_toe_multiplayer/src/features/home/profile/model/user_profile.dart';
import 'package:tic_tac_toe_multiplayer/src/services/local/local_storage_service.dart';

class ProfileService {
  UserModel? userData;
  final ProfileDataController dataController = Get.put(ProfileDataController());
  fetchProfileData() async {
    dataController.isLoading.value = true;
    try {
      userData = await getProfileDataA();
      if (userData != null) {
        dataController.isLoading.value = false;
      }
    } catch (e) {
      throw Exception("something went wrong, error: $e");
    } finally {
      dataController.isLoading.value = false;
    }
  }

  Future<UserModel?> getProfileDataA() async {
    try {
      final storageService = LocalStorageService();
      var uid = await storageService.getToken();
      final userData =
          await FirebaseFirestore.instance.collection(users).doc(uid).get();
      if (userData.exists) {
        return UserModel.fromJson(userData.data()!);
      } else {}
    } on FirebaseFirestore catch (e) {
      throw Exception("something went wrong, error: $e");
    }
    return null;
  }
}
