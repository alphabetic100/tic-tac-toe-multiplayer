import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:tic_tac_toe_multiplayer/src/core/customs/screen_size.dart';
import 'package:tic_tac_toe_multiplayer/src/core/customs/widgets/error_alert_dialog.dart';
import 'package:tic_tac_toe_multiplayer/src/core/utils/themes/styles/custom_text_style.dart';
import 'package:tic_tac_toe_multiplayer/src/features/create-game-room/controller/play_board_controller.dart';

import '../../../../../core/utils/colors/my_colors.dart';

class OnlineBoardAppBar extends StatelessWidget implements PreferredSizeWidget {
  OnlineBoardAppBar({super.key, this.opponentName = "opponent name"});
  final String opponentName;
  final PlayBoardController playBoardController =
      Get.put(PlayBoardController());
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kToolbarHeight + 30,
      width: ScreenSize.width,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 12,
            right: 12,
          ),
          child: Row(
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
                          context.goNamed("home");
                        },
                        cencel: "cencel",
                        onCencel: () {
                          Navigator.of(context).pop();
                        },
                        errorMassage: "If you leave the room you will lose",
                      );
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

              // Opponent name
              Text(
                opponentName,
                style: CustomTextStyle.titleStyle,
              ),
              //
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
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
