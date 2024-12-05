import 'package:get/get.dart';

class CustomTextFieldController extends GetxController {
  RxBool obsecureText = false.obs;
toggleObsecureText() {
    obsecureText.value = !obsecureText.value;
  }
}
