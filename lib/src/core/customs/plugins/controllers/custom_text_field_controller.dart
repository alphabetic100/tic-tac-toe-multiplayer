import 'package:get/get.dart';

class CustomTextFieldController extends GetxController {
  RxBool obsecureText = true.obs;
  toggleObsecureText() {
    obsecureText.value = !obsecureText.value;
  }
}
