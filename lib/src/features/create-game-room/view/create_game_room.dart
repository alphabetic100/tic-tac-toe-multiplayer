import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe_multiplayer/src/core/customs/plugins/view/custom_button.dart';
import 'package:tic_tac_toe_multiplayer/src/core/customs/screen_size.dart';
import 'package:tic_tac_toe_multiplayer/src/core/customs/widgets/custom_o_widget.dart';
import 'package:tic_tac_toe_multiplayer/src/core/customs/widgets/custom_x_widget.dart';
import 'package:tic_tac_toe_multiplayer/src/core/customs/widgets/custome_size_box.dart';
import 'package:tic_tac_toe_multiplayer/src/core/customs/widgets/error_alert_dialog.dart';
import 'package:tic_tac_toe_multiplayer/src/core/utils/colors/my_colors.dart';
import 'package:tic_tac_toe_multiplayer/src/core/utils/themes/styles/custom_text_style.dart';
import 'package:tic_tac_toe_multiplayer/src/features/create-game-room/controller/play_board_controller.dart';
import 'package:tic_tac_toe_multiplayer/src/features/create-game-room/room-components/play_board.dart';
import 'package:tic_tac_toe_multiplayer/src/features/create-game-room/room-components/top_bar.dart';

class CreateGameRoom extends StatelessWidget {
  CreateGameRoom({super.key});
  final PlayBoardController playBoardController =
      Get.put(PlayBoardController());
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
               TopBar(),
              const HorizontalSpace(height: 10),
              // playBoard view
              PlayBoard(),
              const HorizontalSpace(height: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Next move:",
                    style: CustomTextStyle.titleStyle,
                  ),
                  const HorizontalSpace(height: 20),
                  SizedBox(
                    width: ScreenSize.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Obx(() {
                          if (!playBoardController.currentMove.value) {
                            return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                color: MyColors.vividBlue.withOpacity(0.4),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: CustomOWidget(large: true),
                              ),
                            );
                          } else {
                            return const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: CustomOWidget(large: true),
                            );
                          }
                        }),
                        const VerticalSpace(width: 10),
                        const SizedBox(
                          height: 50,
                          child: VerticalDivider(
                            width: 3,
                            thickness: 3,
                            color: MyColors.darkGrey,
                          ),
                        ),
                        const VerticalSpace(width: 10),
                        Obx(() {
                          if (playBoardController.currentMove.value) {
                            return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                color: MyColors.turquoise.withOpacity(0.4),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: CustomXWidget(large: true),
                              ),
                            );
                          } else {
                            return const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: CustomXWidget(large: true),
                            );
                          }
                        })
                      ],
                    ),
                  ),
                ],
              ),
              HorizontalSpace(height: ScreenSize.height * 0.05),
              //
              SizedBox(
                width: ScreenSize.width * 0.4,
                child: CustomButton(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (_) {
                          return ErrorAlertDialog(
                              confirm: "Yes",
                              onConfirm: () {
                                playBoardController.clearBoard();
                                Navigator.of(context).pop();
                              },
                              errorMassage:
                                  "Are You sure you wanna cleare the board");
                        },
                      );
                    },
                    child: const Text(
                      "clear Board",
                      style: CustomTextStyle.buttonTextstyle,
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
