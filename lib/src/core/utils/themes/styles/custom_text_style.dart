import 'package:flutter/material.dart';
import 'package:tic_tac_toe_multiplayer/src/core/constants/font_family.dart';
import 'package:tic_tac_toe_multiplayer/src/core/utils/colors/my_colors.dart';

class CustomTextStyle {
  static const TextStyle introStyle = TextStyle(
    fontFamily: tradeWinds,
    fontSize: 25,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle titleStyle = TextStyle(
    fontFamily: syneMono,
    fontSize: 20,
    letterSpacing: 0.8,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle regularStyle = TextStyle(
    fontFamily: syneMono,
    fontSize: 16,
    color: MyColors.slateBlue,
    fontWeight: FontWeight.bold,
  );
}
