import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tic_tac_toe_multiplayer/src/core/customs/plugins/view/custom_button.dart';
import 'package:tic_tac_toe_multiplayer/src/features/personal-deshboard/view/personal_dashboard.dart';
import 'package:tic_tac_toe_multiplayer/src/core/customs/screen_size.dart';
import 'package:tic_tac_toe_multiplayer/src/core/customs/widgets/custome_size_box.dart';
import 'package:tic_tac_toe_multiplayer/src/core/utils/colors/my_colors.dart';
import 'package:tic_tac_toe_multiplayer/src/core/utils/themes/styles/custom_text_style.dart';
import 'package:tic_tac_toe_multiplayer/src/core/customs/plugins/view/botom_view.dart';
import 'package:tic_tac_toe_multiplayer/src/features/home/components/options_view.dart';
import 'package:tic_tac_toe_multiplayer/src/features/home/profile/view/profile_drawer.dart';
import 'package:tic_tac_toe_multiplayer/src/services/local/local_storage_service.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final LocalStorageService localStorageService = LocalStorageService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.white,
        surfaceTintColor: MyColors.white,
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
        physics: const NeverScrollableScrollPhysics(),
        child: SizedBox(
          height: ScreenSize.height - kToolbarHeight * (1.5),
          width: ScreenSize.width,
          child: Column(
            children: [
              // fixed bar
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
              // boady part
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          HorizontalSpace(height: ScreenSize.height * 0.05),
                          const Text(
                            "My deshboard",
                            style: CustomTextStyle.regularStyle,
                          ),
                          const HorizontalSpace(height: 10),
                          SizedBox(
                              height: ScreenSize.height * 0.3,
                              width: ScreenSize.width,
                              // color: MyColors.slateBlue,
                              child: const PersonalDashboard()),
                          HorizontalSpace(height: ScreenSize.height * 0.05),
                          // game mode
                          const OptionsView(),
                          const HorizontalSpace(height: 20),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: ScreenSize.width * 0.1),
                            child: CustomButton(
                              onTap: () {
                                // localStorageService.deleteToken();
                                context.pushNamed("globalRank");
                              },
                              color: MyColors.vividBlue,
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.person_search_rounded,
                                    color: MyColors.white,
                                  ),
                                  VerticalSpace(width: 10),
                                  Text(
                                    "see global rank",
                                    style: CustomTextStyle.buttonTextstyle,
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              BottomView(
                bottomViewtitle: "click to read the trums and conditions",
                navigationTitle: "Here",
                ontap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
