import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:tic_tac_toe_multiplayer/src/core/customs/screen_size.dart';
import 'package:tic_tac_toe_multiplayer/src/core/utils/colors/my_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onTap,
    required this.child,
    this.color,
  });
  final Callback onTap;
  final Color? color;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 48,
        width: ScreenSize.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: color ?? MyColors.slateBlue,
        ),
        child: Center(
          child: child,
        ),
      ),
    );
  }
}
