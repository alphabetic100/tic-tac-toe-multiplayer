import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:tic_tac_toe_multiplayer/src/core/constants/animation_asset.dart';
import 'package:tic_tac_toe_multiplayer/src/core/customs/plugins/view/custom_button.dart';
import 'package:tic_tac_toe_multiplayer/src/core/customs/screen_size.dart';
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
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                child: Lottie.asset(
                  loadingIndicator,
                  repeat: true,
                  fit: BoxFit.fill,
                  backgroundLoading: true,
                ),
              ),
              HorizontalSpace(height: ScreenSize.height * 0.1),
              const Text(
                "Welcome to Tic Tac Toe: A Battle of Wits!",
                style: CustomTextStyle.titleStyle,
                textAlign: TextAlign.center,
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
