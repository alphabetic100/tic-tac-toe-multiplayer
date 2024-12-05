import 'package:flutter/material.dart';
import 'package:tic_tac_toe_multiplayer/src/core/customs/screen_size.dart';
import 'package:tic_tac_toe_multiplayer/src/core/customs/widgets/custome_size_box.dart';
import 'package:tic_tac_toe_multiplayer/src/core/utils/colors/my_colors.dart';
import 'package:tic_tac_toe_multiplayer/src/core/utils/themes/styles/custom_text_style.dart';
import 'package:tic_tac_toe_multiplayer/src/core/customs/plugins/view/botom_view.dart';
import 'package:tic_tac_toe_multiplayer/src/features/home/components/options_view.dart';
import 'package:tic_tac_toe_multiplayer/src/features/home/components/profile_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.white,
        actions: [
          Container(
            decoration: BoxDecoration(
              color: MyColors.lightGrey.withOpacity(0.5),
              borderRadius: BorderRadius.circular(25),
            ),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(
                    Icons.person_outline,
                    color: MyColors.vividBlue,
                  ),
                  Text(
                    "My Friends",
                    style: CustomTextStyle.regularStyle,
                  ),
                ],
              ),
            ),
          ),
          const VerticalSpace(width: 12),
        ],
      ),
      drawer: const ProfileDrawer(),
      backgroundColor: MyColors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          height: ScreenSize.height - (kToolbarHeight + 25),
          width: ScreenSize.width,
          child: Column(
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
              BottomView(
                bottomViewtitle: "click to read the trums and conditions",
                navigationTitle: "Here",
                ontap: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
