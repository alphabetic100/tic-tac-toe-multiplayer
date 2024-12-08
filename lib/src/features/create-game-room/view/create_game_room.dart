import 'package:flutter/material.dart';
import 'package:tic_tac_toe_multiplayer/src/core/customs/screen_size.dart';
import 'package:tic_tac_toe_multiplayer/src/core/customs/widgets/custome_size_box.dart';
import 'package:tic_tac_toe_multiplayer/src/core/utils/colors/my_colors.dart';
import 'package:tic_tac_toe_multiplayer/src/features/create-game-room/room-components/play_board.dart';
import 'package:tic_tac_toe_multiplayer/src/features/create-game-room/room-components/top_bar.dart';

class CreateGameRoom extends StatefulWidget {
  const CreateGameRoom({super.key});

  @override
  State<CreateGameRoom> createState() => _CreateGameRoomState();
}

class _CreateGameRoomState extends State<CreateGameRoom> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.white,
        body: SizedBox(
          height: ScreenSize.height,
          width: ScreenSize.width,
          child: Column(
            children: [
              //top bar
              const TopBar(),
              const HorizontalSpace(height: 10),
              // playBoard view
              PlayBoard()
              //
            ],
          ),
        ),
      ),
    );
  }
}
