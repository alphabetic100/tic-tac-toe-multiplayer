import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe_multiplayer/src/core/customs/screen_size.dart';
import 'package:tic_tac_toe_multiplayer/src/core/customs/widgets/custome_size_box.dart';
import 'package:tic_tac_toe_multiplayer/src/core/utils/colors/my_colors.dart';
import 'package:tic_tac_toe_multiplayer/src/core/utils/themes/styles/custom_text_style.dart';
import 'package:tic_tac_toe_multiplayer/src/features/create-game-room/controller/play_board_controller.dart';
import 'package:tic_tac_toe_multiplayer/src/features/create-game-room/view/online-room/components/controller/timer_controller.dart';

class OpponentView extends StatelessWidget {
  OpponentView({super.key});
  final PlayBoardController playBoardController =
      Get.put(PlayBoardController());
  final TimerController timerController = Get.put(TimerController());
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ScreenSize.height * 0.15,
      width: ScreenSize.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: kToolbarHeight,
              width: ScreenSize.width * 0.21,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: MyColors.grayishBlue.withOpacity(0.6),
              ),
              child: Center(
                child: Obx(() {
                  return Text(
                    timerController.opponentTimer.value.toString(),
                    style: CustomTextStyle.regularStyle,
                  );
                }),
              ),
            ),
            const VerticalSpace(width: 10),
            Container(
              height: kToolbarHeight * 1.5,
              width: kToolbarHeight * 1.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: MyColors.lightGrey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
