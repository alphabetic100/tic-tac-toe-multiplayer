import 'package:flutter/material.dart';

class SuccessAlertDialog extends StatelessWidget {
  const SuccessAlertDialog({super.key, required this.successMassage});
  final String successMassage;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        "success",
        style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
      ),
      icon: const Icon(
        Icons.verified,
        size: 35,
      ),
      iconColor: Colors.green,
      iconPadding: const EdgeInsets.all(8),
      content: SizedBox(
        height: 30,
        child: Center(
          child: Text(
            successMassage,
            style: const TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      ),
    );
  }
}
