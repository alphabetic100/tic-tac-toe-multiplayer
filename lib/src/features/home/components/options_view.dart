import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:tic_tac_toe_multiplayer/src/core/customs/screen_size.dart';
import 'package:tic_tac_toe_multiplayer/src/core/customs/widgets/custome_size_box.dart';
import 'package:tic_tac_toe_multiplayer/src/core/utils/colors/my_colors.dart';
import 'package:tic_tac_toe_multiplayer/src/core/utils/themes/styles/custom_text_style.dart';

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
                context.pushNamed("logIn");
                //TODO: have to implement play offline page
              },
              child: Container(
                height: ScreenSize.height * 0.15,
                width: ScreenSize.height * 0.15,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: const [
                    BoxShadow(
                      color: MyColors.lightGrey,
                      spreadRadius: 5,
                      blurRadius: 3,
                    )
                  ],
                  border: Border.all(color: MyColors.turquoise),
                ),
                child: Container(
                  decoration: BoxDecoration(
                      color: MyColors.slateBlue,
                      borderRadius: BorderRadius.circular(18)),
                  child: Center(
                    child: Icon(
                      CupertinoIcons.wifi_slash,
                      size: ScreenSize.height * 0.055,
                      color: MyColors.lightGrey,
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
                context.pushNamed("signUp");
                //TODO: have to implement play offline page
              },
              child: Container(
                height: ScreenSize.height * 0.15,
                width: ScreenSize.height * 0.15,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: const [
                    BoxShadow(
                        color: MyColors.lightGrey,
                        spreadRadius: 5,
                        blurRadius: 3)
                  ],
                  border: Border.all(color: MyColors.turquoise),
                ),
                child: Container(
                  decoration: BoxDecoration(
                      color: MyColors.slateBlue,
                      borderRadius: BorderRadius.circular(18)),
                  child: Center(
                    child: Icon(
                      CupertinoIcons.wifi,
                      size: ScreenSize.height * 0.055,
                      color: MyColors.lightGrey,
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
