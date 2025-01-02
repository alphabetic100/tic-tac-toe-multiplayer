import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe_multiplayer/src/core/customs/plugins/controllers/custom_text_field_controller.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    required this.labelText,
    required this.onChanged,
    required this.onSubmitted,
    required this.textInputType,
    this.enableObsecureText = false,
  });
  final String labelText;

  final ValueChanged<String> onChanged;
  final ValueChanged<String> onSubmitted;
  final bool enableObsecureText;
  final TextInputType textInputType;
  final CustomTextFieldController textFieldController =
      Get.put(CustomTextFieldController());
  @override
  Widget build(BuildContext context) {
    if (enableObsecureText) {
      return Obx(() => TextField(
            keyboardType: textInputType,
            onChanged: onChanged,
            onSubmitted: onSubmitted,
            obscureText: textFieldController.obsecureText.value,
            decoration: InputDecoration(
                labelText: labelText,
                suffix: GestureDetector(
                  onTap: () {
                    textFieldController.toggleObsecureText();
                  },
                  child: textFieldController.obsecureText.value
                      ? const Icon(Icons.visibility_off)
                      : const Icon(
                          Icons.visibility,
                        ),
                )),
          ));
    } else {
      return TextField(
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        decoration: InputDecoration(
          labelText: labelText,
        ),
      );
    }
  }
}
