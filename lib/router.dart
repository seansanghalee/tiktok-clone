import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/features/authentication/email_screen.dart';
import 'package:tiktok_clone/features/authentication/log_in_screen.dart';
import 'package:tiktok_clone/features/authentication/sign_up_screen.dart';
import 'package:tiktok_clone/features/authentication/username_screen.dart';
import 'package:tiktok_clone/features/users/user_profile_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      name: SignUpScreen.routeName,
      path: SignUpScreen.routeUrl,
      builder: (context, state) => const SignUpScreen(),
      routes: const [],
    ),
    GoRoute(
      path: "/login",
      builder: (context, state) => const LogInScreen(),
    ),
    GoRoute(
      path: "/username",
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          child: const UsernameScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: ScaleTransition(
                scale: animation,
                child: child,
              ),
            );
          },
        );
      },
    ),
    GoRoute(
        path: "/email",
        builder: (context, state) {
          final args = state.extra as EmailScreenArgs;
          return EmailScreen(username: args.username);
        }),
    GoRoute(
        path: "/users/:username",
        builder: (context, state) {
          final username = state.params["username"];
          final tab = state.queryParams["show"];
          return UserProfileScreen(
            username: username!,
            tab: tab!,
          );
        })
  ],
);
