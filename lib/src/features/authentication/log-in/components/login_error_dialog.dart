import 'package:flutter/material.dart';
import 'package:tic_tac_toe_multiplayer/src/core/utils/colors/my_colors.dart';

class LoginErrorDialog extends StatelessWidget {
  const LoginErrorDialog({super.key, required this.errorMassage});
  final String errorMassage;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        "Worning",
        style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
      ),
      icon: const Icon(Icons.warning_amber_outlined),
      iconColor: Colors.red,
      iconPadding: const EdgeInsets.all(8),
      content: Text(
        errorMassage,
        style: const TextStyle(
          color: Colors.red,
          fontWeight: FontWeight.w400,
        ),
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Center(
              child: Text(
                "ok",
                style: TextStyle(
                    color: MyColors.vividBlue,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ))
      ],
    );
  }
}
