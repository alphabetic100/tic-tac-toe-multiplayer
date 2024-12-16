import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe_multiplayer/src/core/customs/plugins/view/custom_button.dart';
import 'package:tic_tac_toe_multiplayer/src/core/customs/plugins/view/custom_loading_indicator.dart';
import 'package:tic_tac_toe_multiplayer/src/core/customs/screen_size.dart';
import 'package:tic_tac_toe_multiplayer/src/core/customs/widgets/custome_size_box.dart';
import 'package:tic_tac_toe_multiplayer/src/core/utils/colors/my_colors.dart';
import 'package:tic_tac_toe_multiplayer/src/core/utils/themes/styles/custom_text_style.dart';
import 'package:tic_tac_toe_multiplayer/src/features/home/profile/controller/profile_data_controller.dart';
import 'package:tic_tac_toe_multiplayer/src/features/home/profile/service/profile_service.dart';
import 'package:tic_tac_toe_multiplayer/src/features/home/profile/view/components/log_out_alert_dialog.dart';
import 'package:tic_tac_toe_multiplayer/src/features/home/profile/view/components/update_profile_details_dialog.dart';
import 'package:tic_tac_toe_multiplayer/src/services/local/local_storage_service.dart';

class ProfileDrawer extends StatefulWidget {
  const ProfileDrawer({super.key});

  @override
  State<ProfileDrawer> createState() => _ProfileDrawerState();
}

class _ProfileDrawerState extends State<ProfileDrawer> {
  final ProfileDataController dataController = Get.put(ProfileDataController());
  final ProfileService profileService = ProfileService();
  final LocalStorageService storageService = LocalStorageService();
  @override
  void initState() {
    super.initState();
    profileService.fetchProfileData();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: MyColors.white,
      child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
          child: Obx(() {
            if (dataController.isLoading.value) {
              return const Center(
                child: CustomLoadingIndicator(),
              );
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        HorizontalSpace(height: ScreenSize.height * 0.05),
                        Center(
                          child: CircleAvatar(
                            radius: ScreenSize.height * 0.1,
                            backgroundColor: MyColors.grayishBlue,
                          ),
                        ),
                        const HorizontalSpace(height: 20),
                        Text(
                          profileService.userData?.fullName ?? "guest",
                          style: CustomTextStyle.titleStyle,
                        ),
                        Text(
                          profileService.userData?.email ?? "guest@gmail.com",
                          style: CustomTextStyle.regularStyle,
                        ),
                        HorizontalSpace(height: ScreenSize.height * 0.3),
                      ],
                    ),
                  ),
                  // Update button
                  CustomButton(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (_) => UpdateProfileDetailsDialog());
                      },
                      child: const Text(
                        "Update Profile details",
                        style: CustomTextStyle.buttonTextstyle,
                      )),
                  const HorizontalSpace(height: 20),
                  CustomButton(
                    onTap: () async {
                      showDialog(
                        context: context,
                        builder: (_) {
                          return LogOutAlertDialog();
                        },
                      );
                    },
                    color: Colors.redAccent.shade200,
                    child: const Text(
                      "Log out",
                      style: CustomTextStyle.buttonTextstyle,
                    ),
                  )
                ],
              );
            }
          })),
    );
  }
}
