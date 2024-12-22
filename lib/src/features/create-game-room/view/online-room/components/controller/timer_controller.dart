import 'dart:async';

import 'package:get/get.dart';

class TimerController extends GetxController {
  RxInt opponentTimer = 60.obs;
  RxInt myTimer = 60.obs;
  Timer? _myTimer;
  Timer? _opponentTimer;

  void startMyTimer() {
    stopOpponentTimer();
    _myTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (myTimer.value > 0) {
        myTimer.value -= 1;
      } else {
        _myTimer?.cancel();
      }
    });
  }

  void startOpponentTimer() {
    stopMyTimer();
    _opponentTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (opponentTimer.value > 0) {
        opponentTimer.value -= 1;
      } else {
        _opponentTimer?.cancel();
      }
    });
  }

  void stopMyTimer() {
    _myTimer?.cancel();
    myTimer.value = 60; // Reset timer
  }

  void stopOpponentTimer() {
    _opponentTimer?.cancel();
    opponentTimer.value = 60; // Reset timer
  }

  @override
  void onClose() {
    stopMyTimer();
    stopOpponentTimer();
    super.onClose();
  }
}
