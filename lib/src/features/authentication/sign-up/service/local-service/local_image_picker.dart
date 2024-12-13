import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class LocalImagePicker extends GetxController {
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
      }
    } catch (e) {
      throw Exception("Something went wrong, error: $e");
    }
  }
}
