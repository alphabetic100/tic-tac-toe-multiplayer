import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe_multiplayer/src/core/customs/screen_size.dart';
import 'package:tic_tac_toe_multiplayer/src/core/customs/widgets/custome_size_box.dart';
import 'package:tic_tac_toe_multiplayer/src/core/utils/colors/my_colors.dart';
import 'package:tic_tac_toe_multiplayer/src/core/utils/themes/styles/custom_text_style.dart';
import 'package:tic_tac_toe_multiplayer/src/features/home/components/offline_mode_dialog.dart';
import 'package:tic_tac_toe_multiplayer/src/features/home/components/online_mode_dialog.dart';

class OptionsView extends StatelessWidget {
  const OptionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        // play online opiton
        Column(
          children: [
            GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (_) => const OfflineModeDialog());
              },
              child: Container(
                height: ScreenSize.height * 0.15,
                width: ScreenSize.height * 0.15,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: const [
                    BoxShadow(
                      color: MyColors.lightGrey,
                      spreadRadius: 2,
                      blurRadius: 5,
                    )
                  ],
                  border: Border.all(color: MyColors.grayishBlue),
                ),
                child: Container(
                  decoration: BoxDecoration(
                      color: MyColors.grayishBlue,
                      borderRadius: BorderRadius.circular(18)),
                  child: Center(
                    child: Icon(
                      CupertinoIcons.wifi_slash,
                      size: ScreenSize.height * 0.055,
                      color: MyColors.darkGrey,
                    ),
                  ),
                ),
              ),
            ),
            const HorizontalSpace(height: 10),
            const Text(
              "Play offline",
              style: CustomTextStyle.regularStyle,
            )
          ],
        ),
        //play offline option
        Column(
          children: [
            GestureDetector(
              onTap: () {
                showDialog(
                    context: context, builder: (_) =>  OnlineModeDialog());
              },
              child: Container(
                height: ScreenSize.height * 0.15,
                width: ScreenSize.height * 0.15,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: const [
                    BoxShadow(
                        color: MyColors.lightGrey,
                        spreadRadius: 2,
                        blurRadius: 5)
                  ],
                  border: Border.all(color: MyColors.grayishBlue),
                ),
                child: Container(
                  decoration: BoxDecoration(
                      color: MyColors.grayishBlue,
                      borderRadius: BorderRadius.circular(18)),
                  child: Center(
                    child: Icon(
                      CupertinoIcons.wifi,
                      size: ScreenSize.height * 0.055,
                      color: MyColors.darkGrey,
                    ),
                  ),
                ),
              ),
            ),
            const HorizontalSpace(height: 10),
            const Text(
              "Play online",
              style: CustomTextStyle.regularStyle,
            )
          ],
        ),
      ],
    );
  }
}
