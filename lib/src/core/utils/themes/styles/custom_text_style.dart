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
  static const TextStyle buttonTextstyle = TextStyle(
    fontFamily: syneMono,
    fontSize: 18,
    color: MyColors.white,
    fontWeight: FontWeight.w100,
  );
  static const TextStyle oTextStyle = TextStyle(
    fontFamily: syneMono,
    fontSize: 18,
    color: MyColors.turquoise,
    fontWeight: FontWeight.w100,
  );
  static const TextStyle xTextStyle = TextStyle(
    fontFamily: syneMono,
    fontSize: 18,
    color: MyColors.vividBlue,
    fontWeight: FontWeight.w100,
  );
  static const TextStyle drawTextStyle = TextStyle(
    fontFamily: syneMono,
    fontSize: 18,
    color: Colors.brown,
    fontWeight: FontWeight.w100,
  );
}
