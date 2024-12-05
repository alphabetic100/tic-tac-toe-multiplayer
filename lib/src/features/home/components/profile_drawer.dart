import 'package:flutter/material.dart';
import 'package:tic_tac_toe_multiplayer/src/core/customs/screen_size.dart';
import 'package:tic_tac_toe_multiplayer/src/core/customs/widgets/custome_size_box.dart';
import 'package:tic_tac_toe_multiplayer/src/core/utils/colors/my_colors.dart';
import 'package:tic_tac_toe_multiplayer/src/core/utils/themes/styles/custom_text_style.dart';

class ProfileDrawer extends StatelessWidget {
  const ProfileDrawer({super.key});

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
          ],
        ),
      ),
    );
  }
}
