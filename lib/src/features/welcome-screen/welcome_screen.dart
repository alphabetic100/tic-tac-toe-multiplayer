import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:tic_tac_toe_multiplayer/src/core/constants/animation_asset.dart';
import 'package:tic_tac_toe_multiplayer/src/core/customs/plugins/view/custom_button.dart';
import 'package:tic_tac_toe_multiplayer/src/core/customs/widgets/custome_size_box.dart';
import 'package:tic_tac_toe_multiplayer/src/core/utils/colors/my_colors.dart';
import 'package:tic_tac_toe_multiplayer/src/core/utils/themes/styles/custom_text_style.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.grayishBlue,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Are you ready to make your move? Let the fun begin!",
                style: CustomTextStyle.titleStyle,
                textAlign: TextAlign.center,
              ),
              const HorizontalSpace(height: 20),
              const Text(
                "Tic Tac Toe",
                style: CustomTextStyle.introStyle,
              ),
              const Text(
                "(multiplayer edition)",
                style: CustomTextStyle.titleStyle,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                child: Lottie.asset(
                  loadingIndicator,
                  repeat: true,
                  fit: BoxFit.fill,
                  backgroundLoading: true,
                ),
              ),
              const HorizontalSpace(height: 20),
              CustomButton(
                child: const Text(
                  "Lets Begain",
                  style: CustomTextStyle.buttonTextstyle,
                ),
                onTap: () {
                  context.pushNamed("logIn");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
