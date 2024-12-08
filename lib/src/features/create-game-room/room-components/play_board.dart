import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe_multiplayer/src/core/customs/screen_size.dart';
import 'package:tic_tac_toe_multiplayer/src/core/utils/colors/my_colors.dart';
import 'package:tic_tac_toe_multiplayer/src/features/create-game-room/controller/play_board_controller.dart';

class PlayBoard extends StatelessWidget {
  PlayBoard({super.key});
  final PlayBoardController boardController = Get.put(PlayBoardController());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (ScreenSize.width * 0.33) * 3 + 5,
      color: MyColors.lightGrey,
      child: GridView.builder(
        itemCount: 9,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Prevent tap if the cell is already occupied
              if (boardController.playBoardValues[index] == null) {
                boardController.tapped(index);
              } else {
                print("Cell already filled, cannot tap again");
              }
            },
            child: Container(
              height: ScreenSize.width * 0.3,
              width: ScreenSize.width * 0.3,
              color: MyColors.white,
              child: Center(
                child: Obx(() {
                  final cellValue = boardController.playBoardValues[index];
                  if (cellValue != null) {
                    return cellValue;
                  }
                  return const SizedBox(); // Empty cell
                }),
              ),
            ),
          );
        },
      ),
    );
  }
}
