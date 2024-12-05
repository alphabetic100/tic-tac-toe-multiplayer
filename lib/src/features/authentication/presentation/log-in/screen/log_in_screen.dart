import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tic_tac_toe_multiplayer/src/core/customs/plugins/view/custom_button.dart';
import 'package:tic_tac_toe_multiplayer/src/core/customs/plugins/view/custom_text_field.dart';
import 'package:tic_tac_toe_multiplayer/src/core/customs/plugins/view/login_mathodes_view.dart';
import 'package:tic_tac_toe_multiplayer/src/core/customs/screen_size.dart';
import 'package:tic_tac_toe_multiplayer/src/core/customs/widgets/custome_size_box.dart';
import 'package:tic_tac_toe_multiplayer/src/core/customs/widgets/or.dart';
import 'package:tic_tac_toe_multiplayer/src/core/utils/colors/my_colors.dart';
import 'package:tic_tac_toe_multiplayer/src/core/utils/themes/styles/custom_text_style.dart';
import 'package:tic_tac_toe_multiplayer/src/core/customs/plugins/view/botom_view.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.grayishBlue,
      body: SizedBox(
        height: ScreenSize.height,
        width: ScreenSize.width,
        child: Column(children: [
          const HorizontalSpace(height: kToolbarHeight),
          const Text(
            "Log In",
            style: CustomTextStyle.introStyle,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    HorizontalSpace(height: ScreenSize.height * 0.12),
                    CustomTextField(
                      labelText: "enter your email",
                      onChanged: (value) {},
                      onSubmitted: (value) {},
                    ),
                    const HorizontalSpace(height: 20),
                    CustomTextField(
                      labelText: "enter your password",
                      enableObsecureText: true,
                      onChanged: (value) {},
                      onSubmitted: (value) {},
                    ),
                    const HorizontalSpace(height: 20),
                    SizedBox(
                      width: ScreenSize.width,
                      child: GestureDetector(
                        onTap: () {
                          //TODO: have to navigate forgot password screen
                        },
                        child: const Text(
                          "Forgot Password!",
                          style: CustomTextStyle.regularStyle,
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    const HorizontalSpace(height: 20),
                    CustomButton(
                      onTap: () {},
                      child: const Text(
                        "Log In",
                        style: CustomTextStyle.buttonTextstyle,
                      ),
                    ),
                    HorizontalSpace(height: ScreenSize.height * 0.1),
                    const XOr(
                      orTitle: "login with",
                    ),
                    const HorizontalSpace(height: 20),
                    LoginMathodesView(
                      gmailLancher: () {},
                      facebookLancher: () {},
                    )
                  ],
                ),
              ),
            ),
          ),
          BottomView(
            bottomViewtitle: "Don't have any account?",
            navigationTitle: "create now!",
            ontap: () {
              context.pushNamed("signUp");
            },
          )
        ]),
      ),
    );
  }
}
