import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe_multiplayer/src/core/customs/screen_size.dart';
import 'package:tic_tac_toe_multiplayer/src/core/utils/themes/app-themes/app_theme_data.dart';
import 'package:tic_tac_toe_multiplayer/src/router/my_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenSize.init(context);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ticTacToeTheme,
      routerConfig: router,
    );
  }
}
