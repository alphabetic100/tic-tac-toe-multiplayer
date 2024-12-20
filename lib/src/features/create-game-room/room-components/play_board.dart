import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe_multiplayer/src/core/customs/screen_size.dart';
import 'package:tic_tac_toe_multiplayer/src/core/customs/widgets/custom_o_widget.dart';
import 'package:tic_tac_toe_multiplayer/src/core/customs/widgets/custom_x_widget.dart';
import 'package:tic_tac_toe_multiplayer/src/core/customs/widgets/error_alert_dialog.dart';
import 'package:tic_tac_toe_multiplayer/src/core/customs/widgets/success_alert_dialog.dart';
import 'package:tic_tac_toe_multiplayer/src/core/utils/colors/my_colors.dart';
import 'package:tic_tac_toe_multiplayer/src/features/create-game-room/controller/play_board_controller.dart';

class PlayBoard extends StatelessWidget {
  PlayBoard({super.key});
  final PlayBoardController playBoardController =
      Get.put(PlayBoardController());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (ScreenSize.width * 0.33) * 3 + 5,
      color: MyColors.lightGrey,
      child: GridView.builder(
        itemCount: 9,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              if (playBoardController.playBoardValues[index].isEmpty) {
                playBoardController.currentMove.value
                    ? playBoardController.playBoardValues[index] = "x"
                    : playBoardController.playBoardValues[index] = "o";
                playBoardController.changeMove();
              }
              playBoardController.winCheck();
              playBoardController.drawChecker();
              if (playBoardController.winner!.value == "x") {
                playBoardController.xWinTime.value += 1;
                {
                  showDialog(
                      context: context,
                      builder: (_) => const SuccessAlertDialog(
                          successMassage: "X is the winner"));
                  playBoardController.clearBoard();
                }
              } else if (playBoardController.winner!.value == "o") {
                playBoardController.oWinTime.value += 1;
                {
                  showDialog(
                      context: context,
                      builder: (_) => const SuccessAlertDialog(
                          successMassage: "O is the winner"));
                  playBoardController.clearBoard();
                }
              } else {
                if (playBoardController.drawFound) {
                  playBoardController.drawTime.value += 1;
                  showDialog(
                      context: context,
                      builder: (_) => ErrorAlertDialog(
                          onConfirm: () {
                            Navigator.of(context).pop();
                          },
                          errorMassage: "The game is draw"));
                  playBoardController.clearBoard();
                }
              }
            },
            child: Container(
              height: ScreenSize.width * 0.3,
              width: ScreenSize.width * 0.3,
              color: MyColors.white,
              child: Center(
                child: Obx(() {
                  final cellValue = playBoardController.playBoardValues[index];
                  if (cellValue == "x") {
                    return const CustomXWidget(large: true);
                  } else if (cellValue == "o") {
                    return const CustomOWidget(large: true);
                  } else {
                    return const SizedBox();
                  }
                }),
              ),
            ),
          );
        },
      ),
    );
  }
}
