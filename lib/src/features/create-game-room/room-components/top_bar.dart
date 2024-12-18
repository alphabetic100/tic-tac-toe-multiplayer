import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:tic_tac_toe_multiplayer/src/core/customs/screen_size.dart';
import 'package:tic_tac_toe_multiplayer/src/core/customs/widgets/custom_o_widget.dart';
import 'package:tic_tac_toe_multiplayer/src/core/customs/widgets/custom_x_widget.dart';
import 'package:tic_tac_toe_multiplayer/src/core/customs/widgets/custome_size_box.dart';
import 'package:tic_tac_toe_multiplayer/src/core/customs/widgets/error_alert_dialog.dart';
import 'package:tic_tac_toe_multiplayer/src/core/utils/colors/my_colors.dart';
import 'package:tic_tac_toe_multiplayer/src/core/utils/themes/styles/custom_text_style.dart';
import 'package:tic_tac_toe_multiplayer/src/features/create-game-room/controller/play_board_controller.dart';

class TopBar extends StatelessWidget {
  TopBar({super.key});
  final PlayBoardController playBoardController =
      Get.put(PlayBoardController());
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (_) {
                        return ErrorAlertDialog(
                            confirm: "Leave room",
                            onConfirm: () {
                              playBoardController.clearBoard();
                              // Navigator.of(context).pop();
                              context.goNamed("home");
                            },
                            errorMassage:
                                "If you leave the room, you will lose");
                      },
                    );
                  },
                  child: Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: MyColors.turquoise.withOpacity(0.3),
                    ),
                    child: const Center(
                      child: Icon(
                        CupertinoIcons.back,
                        color: MyColors.slateBlue,
                      ),
                    ),
                  ),
                ),
                // if game mode is online?? TODO:
                const Text(
                  "oponent name",
                  style: CustomTextStyle.titleStyle,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: MyColors.lightGrey.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.person_add_alt_outlined,
                          color: MyColors.vividBlue,
                        ),
                        Text(
                          "Add friend",
                          style: CustomTextStyle.regularStyle,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const HorizontalSpace(height: 20),
            // title bar
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Column(
                      children: [
                        CustomOWidget(large: false),
                        Text(
                          "1 wins",
                          style: CustomTextStyle.oTextStyle,
                        )
                      ],
                    ),
                    const Column(
                      children: [
                        CustomXWidget(large: false),
                        Text(
                          "1 wins",
                          style: CustomTextStyle.xTextStyle,
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Icon(
                          Icons.linear_scale_outlined,
                          color: Colors.brown,
                          size: ScreenSize.height * 0.04,
                        ),
                        const Text(
                          "1 draws",
                          style: CustomTextStyle.drawTextStyle,
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
