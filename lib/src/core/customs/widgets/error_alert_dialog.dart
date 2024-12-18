import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:tic_tac_toe_multiplayer/src/core/utils/colors/my_colors.dart';

class ErrorAlertDialog extends StatelessWidget {
  const ErrorAlertDialog(
      {super.key,
      required this.errorMassage,
      this.onConfirm,
      this.confirm,
      this.cencel,
      this.onCencel});
  final String errorMassage;
  final String? confirm;
  final String? cencel;
  final Callback? onConfirm;
  final Callback? onCencel;
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
          fontSize: 16,
        ),
      ),
      actions: [
        TextButton(
          onPressed: onConfirm ??
              () {
                Navigator.of(context).pop();
              },
          child: Center(
            child: Text(
              confirm ?? "ok",
              style: const TextStyle(
                  color: Colors.red, fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
        ),
        TextButton(
            onPressed: onCencel ??
                () {
                  Navigator.of(context).pop();
                },
            child: Center(
              child: Text(
                cencel ?? "cencel",
                style: const TextStyle(
                    color: MyColors.vividBlue,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ))
      ],
    );
  }
}
