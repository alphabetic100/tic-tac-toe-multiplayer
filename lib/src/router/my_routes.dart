import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tic_tac_toe_multiplayer/src/features/authentication/presentation/log-in/screen/log_in_screen.dart';
import 'package:tic_tac_toe_multiplayer/src/features/authentication/presentation/sign-in/screen/sign_up_screen.dart';
import 'package:tic_tac_toe_multiplayer/src/features/create-game-room/view/create_game_room.dart';
import 'package:tic_tac_toe_multiplayer/src/features/global-rank/view/global_rank_view.dart';
import 'package:tic_tac_toe_multiplayer/src/features/home/presentation/home_screen.dart';
import 'package:tic_tac_toe_multiplayer/src/features/splash-screen/splash_screen.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      name: "splash",
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const SplashScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          name: "home",
          path: '/home',
          builder: (BuildContext context, GoRouterState state) {
            return const HomeScreen();
          },
        ),
        GoRoute(
          name: "logIn",
          path: '/logIn',
          builder: (BuildContext context, GoRouterState state) {
            return const LogInScreen();
          },
        ),
        GoRoute(
          name: "signUp",
          path: '/signUp',
          builder: (BuildContext context, GoRouterState state) {
            return SignUpScreen();
          },
        ),
        GoRoute(
          name: "globalRank",
          path: '/globalRank',
          builder: (BuildContext context, GoRouterState state) {
            return const GlobalRankView();
          },
        ),
        GoRoute(
          name: "createGameRoom",
          path: '/createGameRoom',
          builder: (BuildContext context, GoRouterState state) {
            return const CreateGameRoom();
          },
        ),
      ],
    ),
  ],
);
