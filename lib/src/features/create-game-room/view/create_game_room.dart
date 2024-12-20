import 'package:flutter/material.dart';

import 'package:tic_tac_toe_multiplayer/src/features/create-game-room/view/offline-room/play_offline_game_room.dart';
import 'package:tic_tac_toe_multiplayer/src/features/create-game-room/view/online-room/play_online_game_view.dart';

class CreateGameRoom extends StatelessWidget {
  const CreateGameRoom({super.key, required this.playOnlineMode});
  final bool playOnlineMode;

  @override
  Widget build(BuildContext context) {
    if (playOnlineMode) {
      return PlayOnlineGameView();
    } else {
      return PlayOfflineGameRoom();
    }
  }
}
