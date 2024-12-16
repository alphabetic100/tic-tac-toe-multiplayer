import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tic_tac_toe_multiplayer/src/core/customs/screen_size.dart';
import 'package:tic_tac_toe_multiplayer/src/core/utils/colors/my_colors.dart';
import 'package:tic_tac_toe_multiplayer/src/services/local/local_storage_service.dart';

class LogOutAlertDialog extends StatelessWidget {
  LogOutAlertDialog({super.key});
  final LocalStorageService storageService = LocalStorageService();
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
      content: const Text(
        "are you sure! you wanna logout?",
        style: TextStyle(
          color: Colors.red,
          fontSize: 25,
          fontWeight: FontWeight.w400,
        ),
      ),
      actionsPadding: const EdgeInsets.only(bottom: 12),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Center(
              child: Text(
                "cencel",
                style: TextStyle(
                    color: MyColors.vividBlue,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            )),
        Padding(
          padding: EdgeInsets.only(
              left: ScreenSize.width * 0.2, right: ScreenSize.width * 0.2),
          child: TextButton(
              style: ButtonStyle(
                  backgroundColor:
                      WidgetStatePropertyAll(Colors.red.withOpacity(0.1))),
              onPressed: () async {
                await storageService.deleteToken();
                context.goNamed("welcome");
              },
              child: const Center(
                child: Text(
                  "yes",
                  style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              )),
        )
      ],
    );
  }
}
