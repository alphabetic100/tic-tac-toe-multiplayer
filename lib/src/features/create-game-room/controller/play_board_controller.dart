import 'package:get/get.dart';

class PlayBoardController extends GetxController {
  RxBool currentMove = false.obs;
  RxBool xWins = false.obs;
  RxBool oWins = false.obs;
  RxInt xWinTime = 0.obs;
  RxInt oWinTime = 0.obs;
  RxInt drawTime = 0.obs;
  RxString? winner = "".obs;
  RxList<String> playBoardValues = List.generate(9, (_) {
    return "";
  }).obs;
  bool winnerFound = false;
  bool drawFound = false;

  closeRoom() {
    clearBoard();
    oWinTime.value = 0;
    xWinTime.value = 0;
    drawTime.value = 0;
  }

  //To clear The board Value
  clearBoard() {
    playBoardValues.value = List.generate(9, (_) {
      return "";
    }).obs;
    winner!.value = "";
    winnerFound = false;
    drawFound = false;
    countMove = 1;
  }

  clearCurrentWinner() {
    winner?.value = "";
  }

  void changeMove() {
    currentMove.value = !currentMove.value;
  }

  void winCheck() {
    final List index = playBoardValues;
    if (!winnerFound) {
      if (index[0] == "o" && index[1] == "o" && index[2] == "o") {
        winnerFound = true;
        winner?.value = "o";
      } else if (index[3] == "o" && index[4] == "o" && index[5] == "o") {
        winnerFound = true;
        winner?.value = "o";
      } else if (index[6] == "o" && index[7] == "o" && index[8] == "o") {
        winnerFound = true;
        winner?.value = "o";
      } else if (index[0] == "o" && index[3] == "o" && index[6] == "o") {
        winnerFound = true;
        winner?.value = "o";
      } else if (index[1] == "o" && index[4] == "o" && index[7] == "o") {
        winnerFound = true;
        winner?.value = "o";
      } else if (index[2] == "o" && index[5] == "o" && index[8] == "o") {
        winnerFound = true;
        winner?.value = "o";
      } else if (index[0] == "o" && index[4] == "o" && index[8] == "o") {
        winnerFound = true;
        winner?.value = "o";
      } else if (index[2] == "o" && index[4] == "o" && index[6] == "o") {
        winnerFound = true;
        winner?.value = "o";
      }
      //for x
      else if (index[0] == "x" && index[1] == "x" && index[2] == "x") {
        winnerFound = true;
        winner?.value = "x";
      } else if (index[3] == "x" && index[4] == "x" && index[5] == "x") {
        winnerFound = true;
        winner?.value = "x";
      } else if (index[6] == "x" && index[7] == "x" && index[8] == "x") {
        winnerFound = true;
        winner?.value = "x";
      } else if (index[0] == "x" && index[3] == "x" && index[6] == "x") {
        winnerFound = true;
        winner?.value = "x";
      } else if (index[1] == "x" && index[4] == "x" && index[7] == "x") {
        winnerFound = true;
        winner?.value = "x";
      } else if (index[2] == "x" && index[5] == "x" && index[8] == "x") {
        winnerFound = true;
        winner?.value = "x";
      } else if (index[0] == "x" && index[4] == "x" && index[8] == "x") {
        winnerFound = true;
        winner?.value = "x";
      } else if (index[2] == "x" && index[4] == "x" && index[6] == "x") {
        winnerFound = true;
        winner?.value = "x";
      } else {
        winner?.value = "";
      }
    }
  }

  int countMove = 1;
  void drawChecker() {
    countMove += 1;
    if (countMove == 10 && winnerFound == false) {
      drawFound = true;
      countMove = 1;
    } else if (winnerFound) {
      drawFound = false;
      countMove = 1;
    }
  }
}
