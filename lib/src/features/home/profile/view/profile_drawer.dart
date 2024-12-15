import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:tic_tac_toe_multiplayer/src/core/customs/plugins/view/custom_button.dart';
import 'package:tic_tac_toe_multiplayer/src/core/customs/plugins/view/custom_loading_indicator.dart';
import 'package:tic_tac_toe_multiplayer/src/core/customs/screen_size.dart';
import 'package:tic_tac_toe_multiplayer/src/core/customs/widgets/custome_size_box.dart';
import 'package:tic_tac_toe_multiplayer/src/core/utils/colors/my_colors.dart';
import 'package:tic_tac_toe_multiplayer/src/core/utils/themes/styles/custom_text_style.dart';
import 'package:tic_tac_toe_multiplayer/src/features/home/profile/controller/profile_data_controller.dart';
import 'package:tic_tac_toe_multiplayer/src/features/home/profile/service/profile_service.dart';
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
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Obx(() {
            if (dataController.isLoading.value) {
              return const Center(
                child: CustomLoadingIndicator(),
              );
            } else {
              return Column(
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
                    profileService.userData!.fullName,
                    style: CustomTextStyle.titleStyle,
                  ),
                  Text(
                    profileService.userData!.email,
                    style: CustomTextStyle.regularStyle,
                  ),
                  Text(
                    profileService.userData!.createdAt,
                    style: CustomTextStyle.regularStyle,
                  ),
                  HorizontalSpace(height: ScreenSize.height * 0.3),
                  CustomButton(
                      child: const Text("Log out"),
                      onTap: () async {
                        await storageService.deleteToken();
                        context.pushNamed("welcome");
                      })
                ],
              );
            }
          })),
    );
  }
}
