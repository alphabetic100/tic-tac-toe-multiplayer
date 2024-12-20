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
                              playBoardController.closeRoom();
                              // Navigator.of(context).pop();
                              context.goNamed("home");
                            },
                            cencel: "cencel",
                            onCencel: () {
                              Navigator.of(context).pop();
                            },
                            errorMassage:
                                "If you leave the room data will be cleared");
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
                const Text(
                  "Offline mode",
                  style: CustomTextStyle.titleStyle,
                ),
                const SizedBox()
              ],
            ),
            const HorizontalSpace(height: 20),
            // title bar
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        const CustomOWidget(large: false),
                        Obx(() {
                          return Text(
                            "${playBoardController.oWinTime.value} Wins",
                            style: CustomTextStyle.oTextStyle,
                          );
                        })
                      ],
                    ),
                    Column(
                      children: [
                        const CustomXWidget(large: false),
                        Obx(
                          () => Text(
                            "${playBoardController.xWinTime.value} Wins",
                            style: CustomTextStyle.xTextStyle,
                          ),
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
                        Obx(
                          () => Text(
                            "${playBoardController.drawTime} draws",
                            style: CustomTextStyle.drawTextStyle,
                          ),
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
