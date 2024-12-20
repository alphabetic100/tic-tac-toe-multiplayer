import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe_multiplayer/src/core/customs/plugins/view/custom_button.dart';
import 'package:tic_tac_toe_multiplayer/src/core/customs/screen_size.dart';
import 'package:tic_tac_toe_multiplayer/src/core/customs/widgets/custome_size_box.dart';
import 'package:tic_tac_toe_multiplayer/src/core/utils/colors/my_colors.dart';
import 'package:tic_tac_toe_multiplayer/src/core/utils/themes/styles/custom_text_style.dart';
import 'package:tic_tac_toe_multiplayer/src/features/create-game-room/controller/play_board_controller.dart';
import 'package:tic_tac_toe_multiplayer/src/features/create-game-room/room-components/play_board.dart';
import 'package:tic_tac_toe_multiplayer/src/features/create-game-room/view/online-room/components/online_board_app_bar.dart';
import 'package:tic_tac_toe_multiplayer/src/features/create-game-room/view/online-room/components/player_profile_view.dart';

class PlayOnlineGameView extends StatelessWidget {
  PlayOnlineGameView({super.key});
  final PlayBoardController playBoardController =
      Get.put(PlayBoardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyColors.white,
        appBar: OnlineBoardAppBar(),
        body: SizedBox(
          height: ScreenSize.height,
          width: ScreenSize.width,
          child: Column(
            children: [
              // opponent player
              PlayerProfileView(
                mainAxisAlignment: MainAxisAlignment.end,
                myTurn: false,
              ),
              // play board
              Container(
                color: Colors.amberAccent,
                child: PlayBoard(
                  onlineMode: true,
                ),
              ),
              //ui player
              PlayerProfileView(
                mainAxisAlignment: MainAxisAlignment.start,
                myTurn: playBoardController.currentMove.value,
              ),
              //Bottom part of this room
              Expanded(
                child: Container(
                  color: MyColors.grayishBlue.withOpacity(0.4),
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Player 1 Wins",
                                  style: CustomTextStyle.oTextStyle,
                                ),
                                Text(
                                  "0 times",
                                  style: CustomTextStyle.oTextStyle,
                                ),
                              ],
                            ),
                            const VerticalSpace(width: 10),
                            SizedBox(
                              height: ScreenSize.height * 0.04,
                              child: const VerticalDivider(
                                color: MyColors.slateBlue,
                              ),
                            ),
                            const VerticalSpace(width: 10),
                            const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Player 2 Wins",
                                  style: CustomTextStyle.xTextStyle,
                                ),
                                Text(
                                  "0 times",
                                  style: CustomTextStyle.xTextStyle,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: ScreenSize.width * 0.25),
                        child: CustomButton(
                          onTap: () {},
                          color: Colors.red.withOpacity(0.6),
                          child: const Text(
                            "Clear the Board!",
                            style: CustomTextStyle.buttonTextstyle,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
