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

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

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
            "Sign In",
            style: CustomTextStyle.introStyle,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    //gap betwen title and contants
                    HorizontalSpace(height: ScreenSize.height * 0.04),
                    Container(
                      height: ScreenSize.height * 0.2,
                      width: ScreenSize.height * 0.2,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: MyColors.white,
                      ),
                      child: Stack(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              radius: 5003,
                              backgroundColor: MyColors.lightGrey,
                            ),
                          ),
                          Positioned(
                              bottom: 0,
                              right: 10,
                              child: IconButton(
                                style: const ButtonStyle(
                                    backgroundColor: WidgetStatePropertyAll(
                                        MyColors.turquoise)),
                                onPressed: () {
                                  //TODO: Open Image Piceker
                                },
                                icon: const Icon(
                                  Icons.add_a_photo,
                                  size: 30,
                                  color: MyColors.white,
                                ),
                              ))
                        ],
                      ),
                    ),
                    CustomTextField(
                      labelText: "enter yor full name",
                      onChanged: (value) {},
                      onSubmitted: (value) {},
                    ),
                    const HorizontalSpace(height: 20),
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
                    const HorizontalSpace(height: 20),
                    CustomButton(
                      onTap: () {},
                      child: const Text(
                        "Create account",
                        style: CustomTextStyle.buttonTextstyle,
                      ),
                    ),
                    HorizontalSpace(height: ScreenSize.height * 0.1),
                    const XOr(
                      orTitle: "signup with",
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
            bottomViewtitle: "Allready have an account?",
            navigationTitle: "Log In",
            ontap: () {
              context.goNamed("logIn");
            },
          )
        ]),
      ),
    );
  }
}
