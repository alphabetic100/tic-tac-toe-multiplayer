import 'package:flutter/material.dart';
import 'package:tic_tac_toe_multiplayer/src/core/constants/animation_asset.dart';
import 'package:tic_tac_toe_multiplayer/src/core/utils/colors/my_colors.dart';
import 'package:lottie/lottie.dart';
import 'package:tic_tac_toe_multiplayer/src/core/utils/themes/styles/custom_text_style.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.grayishBlue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              child: Lottie.asset(
                gameSplash,
                repeat: false,
                fit: BoxFit.fill,
                addRepaintBoundary: true,
                backgroundLoading: true,
              ),
            ),
            const Text(
              "Tic Tac Toe",
              style: CustomTextStyle.introStyle,
            ),
            const Text(
              "(multiplayer edition)",
              style: CustomTextStyle.titleStyle,
            )
          ],
        ),
      ),
    );
  }
}
