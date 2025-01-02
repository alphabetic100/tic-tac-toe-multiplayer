import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:tic_tac_toe_multiplayer/src/core/constants/animation_asset.dart';
import 'package:tic_tac_toe_multiplayer/src/core/customs/plugins/view/custom_button.dart';
import 'package:tic_tac_toe_multiplayer/src/core/customs/screen_size.dart';
import 'package:tic_tac_toe_multiplayer/src/core/customs/widgets/custome_size_box.dart';
import 'package:tic_tac_toe_multiplayer/src/core/utils/colors/my_colors.dart';
import 'package:tic_tac_toe_multiplayer/src/core/utils/themes/styles/custom_text_style.dart';
import 'package:tic_tac_toe_multiplayer/src/features/create-game-room/view/online-room/controller/matchmaking_controller.dart';

class OnlineModeDialog extends StatelessWidget {
  OnlineModeDialog({super.key});
  final MatchmakingController matchmakingController =
      Get.put(MatchmakingController());

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
          child: Obx(() {
            if (!matchmakingController.isMatchmakingStart.value) {
              return Column(
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
              );
            }
            if (matchmakingController.isMatchmakingStart.value) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      height: ScreenSize.height * 0.2,
                      child: Lottie.asset(loadingIndicator)),
                  Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          matchmakingController.matchmakingProgress.value,
                          style: CustomTextStyle.regularStyle,
                        ),
                        Text(
                          matchmakingController.loadingDot.value,
                          style: CustomTextStyle.regularStyle,
                        ),
                      ],
                    ),
                  )
                ],
              );
            } else {
              return const SizedBox();
            }
          })),
      actions: [
        Obx(
          () => matchmakingController.isMatchmakingStart.value
              ? const SizedBox()
              : CustomButton(
                  onTap: () {
                    matchmakingController.startMatchmaking(context);
                  },
                  child: const Text(
                    "Start Random Matching",
                    style: CustomTextStyle.buttonTextstyle,
                  )),
        ),
        const HorizontalSpace(height: 10),
        CustomButton(
            color: Colors.red.withOpacity(0.6),
            onTap: () {
              matchmakingController.stopMatchmaking();
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
