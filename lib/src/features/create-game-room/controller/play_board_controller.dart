import 'package:get/get.dart';

class PlayBoardController extends GetxController {
  RxBool currentMove = false.obs;

  RxList<String> playBoardValues = List.generate(9, (_) {
    return "";
  }).obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    playBoardValues.clear();
  }

  void changeMove() {
    currentMove.value = !currentMove.value;
  }
  // void tapped(int index) {
  //   return;

  //   //   playBoardValues[index] = currentMove.value
  //   //       ? const CustomOWidget(large: true)
  //   //       : const CustomXWidget(large: true);

  //   //   currentMove.value = !currentMove.value;
  //   // }

  //   //   void resetGame() {
  //   //     playBoardValues.assignAll(List.generate(9, (_) => null));
  //   //     currentMove.value = false;
  //   //   }
  //   // }
  // }
}
