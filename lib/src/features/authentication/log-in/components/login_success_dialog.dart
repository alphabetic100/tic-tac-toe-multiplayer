import 'package:flutter/material.dart';

class LoginSuccessDialog extends StatelessWidget {
  const LoginSuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return const AlertDialog(
      title: Text(
        "success",
        style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
      ),
      icon: Icon(
        Icons.verified,
        size: 35,
      ),
      iconColor: Colors.green,
      iconPadding: EdgeInsets.all(8),
      content: SizedBox(
        height: 30,
        child: Center(
          child: Text(
            "Login successfull",
            style: TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      ),
    );
  }
}
