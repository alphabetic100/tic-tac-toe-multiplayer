import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:tic_tac_toe_multiplayer/src/core/customs/widgets/custome_size_box.dart';
import 'package:tic_tac_toe_multiplayer/src/core/utils/colors/my_colors.dart';

import '../../../utils/themes/styles/custom_text_style.dart';

class BottomView extends StatelessWidget {
  const BottomView(
      {super.key,
      required this.navigationTitle,
      required this.bottomViewtitle,
      required this.ontap});
  final String navigationTitle;
  final String bottomViewtitle;
  final Callback ontap;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      color: MyColors.slateBlue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(bottomViewtitle),
          const VerticalSpace(width: 10),
          InkWell(
            onTap: ontap,
            child: Text(
              "📜$navigationTitle",
              style: CustomTextStyle.buttonTextstyle,
            ),
          )
        ],
      ),
    );
  }
}
