import 'package:flutter/material.dart';
import 'package:tic_tac_toe_multiplayer/src/core/customs/screen_size.dart';
import 'package:tic_tac_toe_multiplayer/src/core/utils/colors/my_colors.dart';

class CustomXWidget extends StatelessWidget {
  const CustomXWidget({super.key, required this.large});

  final bool large;
  @override
  Widget build(BuildContext context) {
    return large
        ? Icon(
            Icons.close,
            size: ScreenSize.height * 0.08,
            weight: 900,
            color: MyColors.vividBlue,
          )
        : Icon(
            Icons.close,
            size: ScreenSize.height * 0.04,
            weight: 900,
            color: MyColors.vividBlue,
          );
  }
}
