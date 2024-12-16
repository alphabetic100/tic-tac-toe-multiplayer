// import 'dart:io';
// import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tic_tac_toe_multiplayer/src/services/auth-services/sign_up_service.dart';

class LocalImagePicker extends GetxController {
  final SignUpService signUpService = SignUpService();
  RxBool callImagePicker = false.obs;
  RxString pickedImagePath = "".obs;

  openImagePicker() {
    callImagePicker.value = true;
  }

  Future<void> imageFromGalleary() async {
    ImagePicker picker = ImagePicker();

    try {
      final image = await picker.pickImage(source: ImageSource.gallery);

      if (image != null) {
        pickedImagePath.value = image.path;
        // String? downloadUrl = await uploadImageToStorage(File(image.path));
        // if (downloadUrl != null) {
        //   signUpService.getImagePath(downloadUrl);
        //   // await saveImageUrlToFirestore(downloadUrl);
        // }
      }
    } catch (e) {
      throw Exception("Something went wrong, error: $e");
    }
  }

  // pick image from galleary
  Future<void> imageFromCamera() async {
    ImagePicker picker = ImagePicker();
    try {
      final image = await picker.pickImage(source: ImageSource.camera);
      if (image != null) {
        pickedImagePath.value = image.path;
        // String? downloadUrl = await uploadImageToStorage(File(image.path));
        // if (downloadUrl != null) {
        //   await signUpService.getImagePath(downloadUrl);
        //   print(downloadUrl);
        //   // await saveImageUrlToFirestore(downloadUrl);
      }
    } catch (e) {
      throw Exception("Something went wrong, error: $e");
    }
  }

  // // Upload the image into firebase storage
  // Future<String?> uploadImageToStorage(File image) async {
  //   try {
  //     print("Uploading file: ${image.path}");
  //     String fileName = "profile_${DateTime.now().millisecondsSinceEpoch}";
  //     Reference storageRef =
  //         FirebaseStorage.instance.ref().child("images/$fileName");
  //     print("Storage reference created: images/$fileName");

  //     UploadTask uploadTask = storageRef.putFile(image);
  //     TaskSnapshot snapshot = await uploadTask;

  //     if (snapshot.state == TaskState.success) {
  //       String downloadUrl = await snapshot.ref.getDownloadURL();
  //       print("File uploaded successfully. Download URL: $downloadUrl");
  //       return downloadUrl;
  //     } else {
  //       throw Exception("Upload task failed with state: ${snapshot.state}");
  //     }
  //   } catch (e) {
  //     throw Exception("Failed to upload image. Error: $e");
  //   }
  // }
}
