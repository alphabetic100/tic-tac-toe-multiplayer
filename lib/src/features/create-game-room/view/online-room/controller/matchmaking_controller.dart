import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:tic_tac_toe_multiplayer/src/features/create-game-room/service/matchmaking_service.dart';

class MatchmakingController extends GetxController {
  final MatchmakingService matchmakingService = MatchmakingService();
  RxBool isMatchmakingStart = false.obs;
  RxString matchFound = "false".obs;
  RxString loadingDot = "".obs;
  RxString matchmakingProgress = "Matchmaking!".obs;
  Timer? _timer;

  //Start matchmaking
  startMatchmaking(BuildContext context) async {
    isMatchmakingStart.value = true;
    animatedLoadingText();
    try {
      final querySnapshot =
          await matchmakingService.matchmakingcollection.get();

      if (querySnapshot.docs.isEmpty) {
        if (await matchmakingService.createGameRoom()) {
          matchmakingProgress.value = "Waiting for player";
          matchFound.bindStream(docStream());
        }
      } else if (await matchmakingService.joinExistedRoom()) {
        matchmakingProgress.value = "Let's Play!";
        matchFound.bindStream(docStream());
      } else {
        await matchmakingService.createGameRoom();
        matchmakingProgress.value = "Waiting for player";
        matchFound.bindStream(docStream());
      }

      // Listen to `matchFound` for changes
      ever(matchFound, (String value) {
        if (value == 'true') {
          handleMatchFound(context);
        }
      });
    } catch (e) {
      matchmakingProgress.value = "Something went wrong";
      throw Exception("Something went wrong, error: $e");
    }
  }

  //stop matchmaking
  stopMatchmaking() async {
    if (matchmakingProgress.value == "Waiting for player") {
      await matchmakingService.deleteCreatedRoom();
    }
    matchmakingProgress.value = "Matchmaking!";
    isMatchmakingStart.value = false;
    matchFound.value = "false";
    _timer?.cancel(); 
  }

  //Docoment Stream
  Stream<String> docStream() {
    if (matchmakingService.currentRoomId.isEmpty) {
      throw Exception('Current Room ID is null or empty.');
    }

    return FirebaseFirestore.instance
        .collection('matchMaking')
        .doc(matchmakingService.currentRoomId)
        .snapshots()
        .map((snapshot) {
      if (snapshot.exists) {
        final isEmpty = snapshot.data()?['isEmpty'] ?? false;
        return isEmpty ? 'true' : 'false';
      } else {
        throw Exception('Document does not exist.');
      }
    });
  }

  void handleMatchFound(BuildContext context) {
    stopMatchmaking();
    // Use GoRouter to navigate
    context.pushNamed(
      "createGameRoom",
      queryParameters: {"playOnlineMode": "true"},
    );
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
