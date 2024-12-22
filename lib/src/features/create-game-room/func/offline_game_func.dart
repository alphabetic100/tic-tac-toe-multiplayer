import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe_multiplayer/src/core/customs/widgets/error_alert_dialog.dart';
import 'package:tic_tac_toe_multiplayer/src/core/customs/widgets/success_alert_dialog.dart';
import 'package:tic_tac_toe_multiplayer/src/features/create-game-room/controller/play_board_controller.dart';

offlineModeFunc(BuildContext context, int index) {
  final PlayBoardController playBoardController =
      Get.put(PlayBoardController());
  if (playBoardController.playBoardValues[index].isEmpty) {
    playBoardController.drawChecker();
    playBoardController.currentMove.value
        ? playBoardController.playBoardValues[index] = "o"
        : playBoardController.playBoardValues[index] = "x";
    playBoardController.changeMove();
  }
  playBoardController.winCheck();

  if (playBoardController.winner!.value == "x") {
    playBoardController.xWinTime.value += 1;
    {
      showDialog(
          context: context,
          builder: (_) =>
              const SuccessAlertDialog(successMassage: "X is the winner"));
      playBoardController.clearBoard();
    }
  } else if (playBoardController.winner!.value == "o") {
    playBoardController.oWinTime.value += 1;
    {
      showDialog(
          context: context,
          builder: (_) =>
              const SuccessAlertDialog(successMassage: "O is the winner"));
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
}
