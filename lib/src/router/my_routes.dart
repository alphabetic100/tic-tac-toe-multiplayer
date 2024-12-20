import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tic_tac_toe_multiplayer/src/features/authentication/log-in/screen/log_in_screen.dart';
import 'package:tic_tac_toe_multiplayer/src/features/authentication/sign-up/screen/sign_up_screen.dart';
import 'package:tic_tac_toe_multiplayer/src/features/create-game-room/view/create_game_room.dart';
import 'package:tic_tac_toe_multiplayer/src/features/global-rank/view/global_rank_view.dart';
import 'package:tic_tac_toe_multiplayer/src/features/home/presentation/home_screen.dart';
import 'package:tic_tac_toe_multiplayer/src/features/splash-screen/splash_screen.dart';
import 'package:tic_tac_toe_multiplayer/src/features/welcome-screen/welcome_screen.dart';

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
          name: "welcome",
          path: '/welcome',
          builder: (BuildContext context, GoRouterState state) {
            return const WelcomeScreen();
          },
        ),
        GoRoute(
          name: "home",
          path: '/home',
          builder: (BuildContext context, GoRouterState state) {
            return HomeScreen();
          },
        ),
        GoRoute(
          name: "logIn",
          path: '/logIn',
          builder: (BuildContext context, GoRouterState state) {
            return LogInScreen();
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
            final playOnlineMode =
                state.uri.queryParameters['playOnlineMode'] == 'true';
            return CreateGameRoom(
              playOnlineMode: playOnlineMode,
            );
          },
        ),
      ],
    ),
  ],
);
