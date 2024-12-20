import 'dart:async';
import 'package:get/get.dart';

class TimerController extends GetxController {
  RxInt opponetTimer = 60.obs;
  RxInt myTimer = 60.obs;
  Timer? _myTimer;
  Timer? _opponentTimer;

  // Start my timer
  void myTimerStart() {
    stopOpponentTimers(); // Ensure opponent timer is stopped
    _myTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (myTimer.value > 0) {
        myTimer.value--;
      } else {
        _myTimer?.cancel();
      }
    });
  }

  // Start opponent timer
  void opponentTimerStart() {
    stopMyTimers();
    _opponentTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (opponetTimer.value > 0) {
        opponetTimer.value--;
      } else {
        _opponentTimer?.cancel();
      }
    });
  }

  // Stop my timer
  void stopMyTimers() {
    _myTimer?.cancel();
    myTimer.value = 60;
  }

  // Stop opponent timer
  void stopOpponentTimers() {
    _opponentTimer?.cancel();
    opponetTimer.value = 60;
  }

  // Ensure timers are cancelled when the controller is closed
  @override
  void onClose() {
    stopMyTimers();
    stopOpponentTimers();
    super.onClose();
  }
}
