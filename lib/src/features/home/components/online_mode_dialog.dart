import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:tic_tac_toe_multiplayer/src/core/constants/animation_asset.dart';
import 'package:tic_tac_toe_multiplayer/src/core/customs/plugins/view/custom_button.dart';
import 'package:tic_tac_toe_multiplayer/src/core/customs/screen_size.dart';
import 'package:tic_tac_toe_multiplayer/src/core/customs/widgets/custome_size_box.dart';
import 'package:tic_tac_toe_multiplayer/src/core/utils/colors/my_colors.dart';
import 'package:tic_tac_toe_multiplayer/src/core/utils/themes/styles/custom_text_style.dart';

class OnlineModeDialog extends StatelessWidget {
  const OnlineModeDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Center(
        child: Text(
          "Multiplayer Online",
          textAlign: TextAlign.center,
          style: CustomTextStyle.titleStyle,
        ),
      ),
      content: SizedBox(
        height: ScreenSize.height * 0.3,
        width: ScreenSize.width * 0.85,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
              onTap: () {},
              color: MyColors.vividBlue,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    CupertinoIcons.person_solid,
                    color: MyColors.white,
                  ),
                  VerticalSpace(width: 5),
                  Text(
                    "Invite Friend",
                    style: CustomTextStyle.buttonTextstyle,
                  )
                ],
              ),
            ),
            SizedBox(
                height: ScreenSize.height * 0.2,
                child: Lottie.asset(loadingIndicator)),
          ],
        ),
      ),
      actions: [
        CustomButton(
            onTap: () {
              context.pushNamed("createGameRoom",
                  queryParameters: {"playOnlineMode": "true"});
              context.pop();
            },
            child: const Text(
              "Start Random Matching",
              style: CustomTextStyle.buttonTextstyle,
            )),
        const HorizontalSpace(height: 10),
        CustomButton(
            color: Colors.red.withOpacity(0.6),
            onTap: () {
              context.pop();
            },
            child: const Text(
              "Cencel",
              style: CustomTextStyle.buttonTextstyle,
            )),
      ],
    );
  }
}
