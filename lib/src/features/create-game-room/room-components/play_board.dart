import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe_multiplayer/src/core/customs/screen_size.dart';
import 'package:tic_tac_toe_multiplayer/src/core/customs/widgets/custom_o_widget.dart';
import 'package:tic_tac_toe_multiplayer/src/core/customs/widgets/custom_x_widget.dart';
import 'package:tic_tac_toe_multiplayer/src/core/utils/colors/my_colors.dart';
import 'package:tic_tac_toe_multiplayer/src/features/create-game-room/controller/play_board_controller.dart';
import 'package:tic_tac_toe_multiplayer/src/features/create-game-room/func/offline_game_func.dart';
import 'package:tic_tac_toe_multiplayer/src/features/create-game-room/func/online_game_func.dart';

class PlayBoard extends StatelessWidget {
  PlayBoard({super.key, required this.onlineMode});
  final bool onlineMode;
  final PlayBoardController playBoardController =
      Get.put(PlayBoardController());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (ScreenSize.width * 0.33) * 3 + 5,
      color: MyColors.lightGrey,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 9,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              if (onlineMode) {
                onlineModeFunc(context, index);
              } else {
                offlineModeFunc(context, index);
              }
            },
            child: Container(
              height: ScreenSize.width * 0.3,
              width: ScreenSize.width * 0.3,
              color: MyColors.white,
              child: Center(
                child: Obx(() {
                  final cellValue = playBoardController.playBoardValues[index];
                  if (cellValue == "x") {
                    return const CustomXWidget(large: true);
                  } else if (cellValue == "o") {
                    return const CustomOWidget(large: true);
                  } else {
                    return const SizedBox();
                  }
                }),
              ),
            ),
          );
        },
      ),
    );
  }
}
