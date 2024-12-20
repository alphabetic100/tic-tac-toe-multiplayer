import 'package:flutter/material.dart';

import 'package:tic_tac_toe_multiplayer/src/features/create-game-room/view/online-room/play_offline_game_room.dart';

class CreateGameRoom extends StatelessWidget {
  const CreateGameRoom({super.key, required this.playOnlineMode});
  final bool playOnlineMode;

  @override
  Widget build(BuildContext context) {
    if (playOnlineMode) {
      return Scaffold(
        appBar: AppBar(),
        body: const Center(
          child: Text("this page is under developement"),
        ),
      );
    } else {
      return PlayOfflineGameRoom();
    }
  }
}
