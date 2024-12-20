import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tic_tac_toe_multiplayer/src/core/customs/plugins/view/custom_button.dart';
import 'package:tic_tac_toe_multiplayer/src/core/customs/screen_size.dart';
import 'package:tic_tac_toe_multiplayer/src/core/customs/widgets/custom_o_widget.dart';
import 'package:tic_tac_toe_multiplayer/src/core/customs/widgets/custom_x_widget.dart';
import 'package:tic_tac_toe_multiplayer/src/core/customs/widgets/custome_size_box.dart';
import 'package:tic_tac_toe_multiplayer/src/core/utils/themes/styles/custom_text_style.dart';

class OfflineModeDialog extends StatelessWidget {
  const OfflineModeDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Center(
        child: Text(
          "play with you'r friend, OFFLINE",
          textAlign: TextAlign.center,
          style: CustomTextStyle.titleStyle,
        ),
      ),
      content: SizedBox(
        height: ScreenSize.height * 0.3,
        width: ScreenSize.width * 0.85,
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Just a quick reminder",
              style: CustomTextStyle.regularStyle,
            ),
            HorizontalSpace(height: 20),
            Text(
              "Player 1 is :",
              style: CustomTextStyle.oTextStyle,
            ),
            CustomOWidget(large: true),
            HorizontalSpace(height: 10),
            Text(
              "Player 2 is :",
              style: CustomTextStyle.xTextStyle,
            ),
            CustomXWidget(large: true),
          ],
        ),
      ),
      actions: [
        CustomButton(
            onTap: () {
              context.pushNamed("createGameRoom",
                  queryParameters: {"playOnlineMode": "false"});
              context.pop();
            },
            child: const Text(
              "Create room",
              style: CustomTextStyle.buttonTextstyle,
            )),
        const HorizontalSpace(height: 10),
        CustomButton(
            color: Colors.red.withOpacity(0.6),
            onTap: () {
              context.pop();
            },
            child: const Text(
              "Cencel",
              style: CustomTextStyle.buttonTextstyle,
            )),
      ],
    );
  }
}
