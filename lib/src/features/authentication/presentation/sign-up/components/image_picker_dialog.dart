import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe_multiplayer/src/core/customs/screen_size.dart';
import 'package:tic_tac_toe_multiplayer/src/core/customs/widgets/custome_size_box.dart';
import 'package:tic_tac_toe_multiplayer/src/core/utils/colors/my_colors.dart';
import 'package:tic_tac_toe_multiplayer/src/features/authentication/presentation/sign-up/service/local-service/local_image_picker.dart';

class ImagePickerDialog extends StatelessWidget {
  ImagePickerDialog({super.key});
  final LocalImagePicker imagePicker = Get.put(LocalImagePicker());
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Image sourse"),
      content: SizedBox(
        height: ScreenSize.height * 0.15,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //select image from galleary
            GestureDetector(
              onTap: () async {
                await imagePicker.imageFromGalleary();
                Navigator.of(context).pop();
              },
              child: Container(
                height: ScreenSize.height * 0.07,
                width: ScreenSize.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: MyColors.lightGrey,
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.photo_library,
                    ),
                    VerticalSpace(width: 10),
                    Text("From gallery")
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () async {
                await imagePicker.imageFromCamera();
                Navigator.of(context).pop();
              },
              child: Container(
                height: ScreenSize.height * 0.07,
                width: ScreenSize.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: MyColors.lightGrey,
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.camera_alt,
                    ),
                    VerticalSpace(width: 10),
                    Text("From camera")
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
