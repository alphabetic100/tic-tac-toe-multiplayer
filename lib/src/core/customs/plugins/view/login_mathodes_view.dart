import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:tic_tac_toe_multiplayer/src/core/customs/screen_size.dart';
import 'package:tic_tac_toe_multiplayer/src/core/customs/widgets/custome_size_box.dart';
import 'package:tic_tac_toe_multiplayer/src/core/utils/colors/my_colors.dart';

class LoginMathodesView extends StatelessWidget {
  const LoginMathodesView(
      {super.key, required this.gmailLancher, required this.facebookLancher});
  final Callback gmailLancher;
  final Callback facebookLancher;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: gmailLancher,
          child: CircleAvatar(
            backgroundColor: MyColors.white,
            backgroundImage: const AssetImage(
              "assets/icons/facebook_icon.png",
            ),
            radius: ScreenSize.width * 0.07,
          ),
        ),
        VerticalSpace(width: ScreenSize.width * 0.05),
        GestureDetector(
          onTap: facebookLancher,
          child: CircleAvatar(
            backgroundColor: MyColors.white,
            backgroundImage: const AssetImage(
              "assets/icons/google_icon.png",
            ),
            radius: ScreenSize.width * 0.07,
          ),
        ),
      ],
    );
  }
}
