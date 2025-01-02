import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:tic_tac_toe_multiplayer/src/core/customs/plugins/view/custom_button.dart';
import 'package:tic_tac_toe_multiplayer/src/core/customs/plugins/view/custom_text_field.dart';
import 'package:tic_tac_toe_multiplayer/src/core/customs/screen_size.dart';
import 'package:tic_tac_toe_multiplayer/src/core/customs/widgets/custome_size_box.dart';
import 'package:tic_tac_toe_multiplayer/src/core/utils/colors/my_colors.dart';
import 'package:tic_tac_toe_multiplayer/src/core/utils/themes/styles/custom_text_style.dart';
import 'package:tic_tac_toe_multiplayer/src/features/home/profile/controller/profile_data_controller.dart';
import 'package:tic_tac_toe_multiplayer/src/features/home/profile/service/profile_service.dart';

class UpdateProfileDetailsDialog extends StatelessWidget {
  UpdateProfileDetailsDialog({super.key});
  final ProfileDataController dataController = Get.put(ProfileDataController());
  final ProfileService profileService = ProfileService();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: const Icon(
        Icons.update,
        color: MyColors.slateBlue,
      ),
      title: const Text(
        "Update",
        style: TextStyle(color: MyColors.slateBlue),
      ),
      content: SizedBox(
        height: ScreenSize.height * 0.15,
        child: Column(
          children: [
            const Text(
              "Update profile data",
              style: CustomTextStyle.regularStyle,
            ),
            const HorizontalSpace(height: 10),
            CustomTextField(
                textInputType: TextInputType.name,
                
                labelText: "Change user name",
                onChanged: (value) {
                  changedName = value;
                },
                onSubmitted: (value) {
                  changedName = value;
                })
          ],
        ),
      ),
      actions: [
        CustomButton(
            onTap: () async {
              dataController.isLoading.value = true;
              if (changedName.isNotEmpty) {
                await profileService.updateUserData(changedName);
                Navigator.of(context).pop();
                Future.delayed(const Duration(milliseconds: 3000));
                await profileService.fetchProfileData();
                dataController.isLoading.value = false;
              } else {
                dataController.isLoading.value = false;
              }
            },
            child: const Text(
              "update",
              style: CustomTextStyle.buttonTextstyle,
            )),
        const HorizontalSpace(height: 10),
        CustomButton(
          onTap: () {
            context.pop();
          },
          color: Colors.red.withOpacity(0.5),
          child: const Text(
            "cencel",
            style: CustomTextStyle.buttonTextstyle,
          ),
        ),
      ],
    );
  }
}

String changedName = "";
