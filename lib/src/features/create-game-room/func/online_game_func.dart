import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe_multiplayer/src/core/customs/widgets/error_alert_dialog.dart';
import 'package:tic_tac_toe_multiplayer/src/core/customs/widgets/success_alert_dialog.dart';
import 'package:tic_tac_toe_multiplayer/src/features/create-game-room/controller/play_board_controller.dart';
import 'package:tic_tac_toe_multiplayer/src/features/create-game-room/view/online-room/components/controller/timer_controller.dart';

onlineModeFunc(BuildContext context, int index) {
  final PlayBoardController playBoardController =
      Get.put(PlayBoardController());
  final TimerController timerController = Get.put(TimerController());
  if (playBoardController.playBoardValues[index].isEmpty) {
    playBoardController.drawChecker();
    if (playBoardController.currentMove.value) {
      timerController.startOpponentTimer();
      playBoardController.playBoardValues[index] = "o";
    } else {
      timerController.startMyTimer();

      playBoardController.playBoardValues[index] = "x";
    }
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
