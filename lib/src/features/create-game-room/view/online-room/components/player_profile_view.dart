import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe_multiplayer/src/core/customs/screen_size.dart';
import 'package:tic_tac_toe_multiplayer/src/core/customs/widgets/custome_size_box.dart';
import 'package:tic_tac_toe_multiplayer/src/core/utils/colors/my_colors.dart';
import 'package:tic_tac_toe_multiplayer/src/core/utils/themes/styles/custom_text_style.dart';
import 'package:tic_tac_toe_multiplayer/src/features/create-game-room/controller/play_board_controller.dart';
import 'package:tic_tac_toe_multiplayer/src/features/create-game-room/view/online-room/components/controller/timer_controller.dart';

class PlayerProfileView extends StatelessWidget {
  PlayerProfileView({
    super.key,
    required this.mainAxisAlignment,
    required this.myTurn,
  });
  final MainAxisAlignment mainAxisAlignment;
  final bool myTurn;
  final TimerController timerController = Get.put(TimerController());
  final PlayBoardController playBoardController =
      Get.put(PlayBoardController());
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ScreenSize.height * 0.15,
      width: ScreenSize.width,
      child: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12),
        child: Row(
          mainAxisAlignment: mainAxisAlignment,
          children: [
            Container(
              height: kToolbarHeight * 1.5,
              width: kToolbarHeight * 1.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: MyColors.lightGrey,
              ),
            ),
            const VerticalSpace(width: 10),
            Container(
              height: kToolbarHeight,
              width: ScreenSize.width * 0.21,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: MyColors.grayishBlue.withOpacity(0.6),
              ),
              child: Center(
                child: Obx(() {
                  if (playBoardController.currentMove.value) {
                    // Display myTimer
                    int myMinutes = timerController.myTimer.value ~/ 60;
                    int mySeconds = timerController.myTimer.value % 60;

                    return Text(
                      '${myMinutes.toString().padLeft(2, '0')}:${mySeconds.toString().padLeft(2, '0')}',
                      style: CustomTextStyle.regularStyle,
                    );
                  } else {
                    // Display opponentTimer
                    int opponentsMinutes =
                        timerController.opponetTimer.value ~/ 60;
                    int opponentsSeconds =
                        timerController.opponetTimer.value % 60;

                    return Text(
                      '${opponentsMinutes.toString().padLeft(2, '0')}:${opponentsSeconds.toString().padLeft(2, '0')}',
                      style: CustomTextStyle.regularStyle,
                    );
                  }
                }),
              ),
            ),
            if (myTurn) const VerticalSpace(width: 12),
            if (myTurn)
              Obx(
                () => playBoardController.currentMove.value
                    ? const Text(
                        "It's yourt turn",
                        style: CustomTextStyle.regularStyle,
                      )
                    : const SizedBox(),
              )
          ],
        ),
      ),
    );
  }
}
