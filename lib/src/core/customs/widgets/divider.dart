import 'package:flutter/material.dart';
import 'package:tic_tac_toe_multiplayer/src/core/utils/colors/my_colors.dart';

class XDivider extends StatelessWidget {
  const XDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: 5,
      color: MyColors.darkGrey,
      thickness: 1,
    );
  }
}
