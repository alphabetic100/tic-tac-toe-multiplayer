import 'package:flutter/material.dart';
import 'package:tic_tac_toe_multiplayer/src/core/utils/colors/my_colors.dart';

ThemeData ticTacToeTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: MyColors.slateBlue,
  useMaterial3: true,
  colorScheme: const ColorScheme.light(
    secondary: MyColors.slateBlue,
    surface: MyColors.white,
    onSurface: Colors.black87,
  ),
);
