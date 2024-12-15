import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tic_tac_toe_multiplayer/src/core/customs/plugins/view/custom_button.dart';
import 'package:tic_tac_toe_multiplayer/src/core/customs/screen_size.dart';
import 'package:tic_tac_toe_multiplayer/src/core/customs/widgets/custome_size_box.dart';
import 'package:tic_tac_toe_multiplayer/src/core/utils/colors/my_colors.dart';
import 'package:tic_tac_toe_multiplayer/src/core/utils/themes/styles/custom_text_style.dart';
import 'package:tic_tac_toe_multiplayer/src/features/authentication/log-in/screen/log_in_screen.dart';
import 'package:tic_tac_toe_multiplayer/src/features/home/profile/service/profile_service.dart';
import 'package:tic_tac_toe_multiplayer/src/services/local/local_storage_service.dart';

class ProfileDrawer extends StatefulWidget {
  const ProfileDrawer({super.key});

  @override
  State<ProfileDrawer> createState() => _ProfileDrawerState();
}

class _ProfileDrawerState extends State<ProfileDrawer> {
  final ProfileService profileService = ProfileService();
  final LocalStorageService storageService = LocalStorageService();
  fetchProfileData() async {
    await profileService.getProfileDataA();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // profileService.getProfileDataA();
    //   fetchProfileData();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: MyColors.white,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
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
            const Text(
              "Md Nazmul Hasan",
              style: CustomTextStyle.titleStyle,
            ),
            const Text(
              "example@gmail.com",
              style: CustomTextStyle.regularStyle,
            ),
            CustomButton(
                child: const Text("get data"),
                onTap: () async {
                  await fetchProfileData();
                }),
            HorizontalSpace(height: ScreenSize.height * 0.3),
            CustomButton(
                child: const Text("Log out"),
                onTap: () async {
                  await storageService.deleteToken();
                  context.pushNamed("welcome");
                })
          ],
        ),
      ),
    );
  }
}
