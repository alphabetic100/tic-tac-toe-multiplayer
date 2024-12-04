import 'package:flutter/material.dart';
import 'package:tic_tac_toe_multiplayer/src/core/customs/screen_size.dart';
import 'package:tic_tac_toe_multiplayer/src/core/customs/widgets/custome_size_box.dart';
import 'package:tic_tac_toe_multiplayer/src/core/utils/colors/my_colors.dart';
import 'package:tic_tac_toe_multiplayer/src/core/utils/themes/styles/custom_text_style.dart';
import 'package:tic_tac_toe_multiplayer/src/features/home/components/botom_view.dart';
import 'package:tic_tac_toe_multiplayer/src/features/home/components/options_view.dart';
import 'package:tic_tac_toe_multiplayer/src/features/home/components/profile_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.white,
      ),
      drawer: const ProfileDrawer(),
      backgroundColor: MyColors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HorizontalSpace(height: 20),
                const Center(
                  child: Text(
                    "Tic Tac Toe",
                    style: CustomTextStyle.introStyle,
                  ),
                ),
                const Center(
                  child: Text(
                    "Multiplayer edition!",
                    style: CustomTextStyle.regularStyle,
                  ),
                ),
                HorizontalSpace(height: ScreenSize.height * 0.1),
                Container(
                  height: ScreenSize.height * 0.3,
                  width: ScreenSize.width,
                  color: MyColors.slateBlue,
                  child: const Center(
                    child: Text("personal Deshboard"),
                  ),
                ),
                const Text(
                  "My deshboard",
                  style: CustomTextStyle.regularStyle,
                ),
                HorizontalSpace(height: ScreenSize.height * 0.10),
                const OptionsView()
              ],
            ),
          ),
          const BottomView()
        ],
      ),
    );
  }
}
