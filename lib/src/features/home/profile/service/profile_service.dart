import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tic_tac_toe_multiplayer/src/core/constants/const_values.dart';
import 'package:tic_tac_toe_multiplayer/src/features/home/profile/model/user_profile.dart';
import 'package:tic_tac_toe_multiplayer/src/services/local/local_storage_service.dart';

class ProfileService {
  Future<UserModel?> getProfileDataA() async {
    try {
      final LocalStorageService storageService = LocalStorageService();
      final String uid = storageService.getToken().toString();
      final usersData =
          await FirebaseFirestore.instance.collection(users).doc(uid);
      // final fullName = usersData['fullName'];
      // print(fullName);
      
    } catch (e) {
      throw Exception("Something went wrong, error: $e");
    }
    return null;
  }
}
