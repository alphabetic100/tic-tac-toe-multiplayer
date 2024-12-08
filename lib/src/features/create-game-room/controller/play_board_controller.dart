import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe_multiplayer/src/core/customs/widgets/custom_o_widget.dart';
import 'package:tic_tac_toe_multiplayer/src/core/customs/widgets/custom_x_widget.dart';

class PlayBoardController extends GetxController {
  RxBool currentMove = false.obs; // false = X, true = O
  // Initialize playBoardValues as RxList<Widget?> instead of just Widget?
  RxList<Widget?> playBoardValues = List.generate(9, (_) => null).obs;

  void tapped(int index) {
    // Prevent interaction if the cell is already filled
    if (playBoardValues[index] != null) {
      return;
    }

    // Assign the proper widget (X or O) based on the turn
    playBoardValues[index] = currentMove.value
        ? const CustomOWidget(large: true)
        : const CustomXWidget(large: true);

    // Toggle the current move between X and O
    currentMove.value = !currentMove.value;
  }

  void resetGame() {
    // Reset the playBoardValues to all null (empty cells)
    playBoardValues.assignAll(List.generate(9, (_) => null));
    currentMove.value = false; // Start with X's turn
  }
}
