import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:tic_tac_toe_multiplayer/src/features/create-game-room/service/matchmaking_service.dart';

class MatchmakingController extends GetxController {
  final MatchmakingService matchmakingService = MatchmakingService();
  RxBool isMatchmakingStart = false.obs;
  RxBool matchFound = false.obs;
  RxString loadingDot = "".obs;
  RxString matchmakingProgress = "Matchmaking!".obs;
  Timer? _timer;

  startMatchmaking(BuildContext context) async {
    isMatchmakingStart.value = true;
    animatedLoadingText();
    try {
      final querySnapshot =
          await matchmakingService.matchmakingcollection.get();
      if (querySnapshot.docs.isEmpty) {
        if (await matchmakingService.createGameRoom()) {
          matchmakingProgress.value = "Waiting for player";
        }
      } else if (await matchmakingService.joinExistedRoom()) {
        matchmakingProgress.value = "Let's Play!";
        context.pushNamed("createGameRoom",
            queryParameters: {"playOnlineMode": "true"});
        context.pop();
        matchFound.value = true;
      } else {
        matchmakingService.createGameRoom();
        matchmakingProgress.value = "Waiting for player";
      }
    } catch (e) {
      matchmakingProgress.value = "Something went wrong";
      throw Exception("Soemthing went wrong, error: $e");
    }
  }

  //stop matchmaking
  stopMatchmaking() {
    matchmakingProgress.value = "Matchmaking!";
    isMatchmakingStart.value = false;
    _timer!.cancel();
  }

  //Animated Loading text dot
  animatedLoadingText() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (loadingDot.value.length < 3) {
        loadingDot.value += '.';
      } else {
        loadingDot.value = '';
      }
    });
  }

  @override
  void onClose() {
    super.onClose();
    isMatchmakingStart.close();
    _timer!.cancel();
  }
}
