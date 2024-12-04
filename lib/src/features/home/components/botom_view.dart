import 'package:flutter/material.dart';
import 'package:tic_tac_toe_multiplayer/src/core/customs/widgets/custome_size_box.dart';
import 'package:tic_tac_toe_multiplayer/src/core/utils/colors/my_colors.dart';

import '../../../core/utils/themes/styles/custom_text_style.dart';

class BottomView extends StatelessWidget {
  const BottomView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
            height: 40,
            color: MyColors.grayishBlue,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text("click to read the trums and conditions"),
                const VerticalSpace(width: 10),
                InkWell(
                  onTap: () {},
                  child: const Text(
                    "📜Here",
                    style: CustomTextStyle.regularStyle,
                  ),
                )
              ],
            ),
          );
  }
}