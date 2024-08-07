import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/common/widgets/main_navigation/main_navigation_screen.dart';
import 'package:tiktok_clone/features/authentication/log_in_screen.dart';
import 'package:tiktok_clone/features/authentication/repos/authentication_repo.dart';
import 'package:tiktok_clone/features/authentication/sign_up_screen.dart';
import 'package:tiktok_clone/features/inbox/activity_screen.dart';
import 'package:tiktok_clone/features/inbox/chat_detail_screen.dart';
import 'package:tiktok_clone/features/inbox/chats_screen.dart';
import 'package:tiktok_clone/features/onboarding/interests_screen.dart';
import 'package:tiktok_clone/features/videos/views/video_recording_screen.dart';

final routerProvider = Provider((ref) {
  // ref.watch(authState);
  return GoRouter(
    initialLocation: "/home",
    redirect: (context, state) {
      const isLoggedIn = true;
      if (!isLoggedIn) {
        if (state.subloc != SignUpScreen.routeUrl &&
            state.subloc != LogInScreen.routeUrl) {
          return SignUpScreen.routeUrl;
        }
      }
      return null;
    },
    routes: [
      GoRoute(
        name: SignUpScreen.routeName,
        path: SignUpScreen.routeUrl,
        builder: (context, state) => const SignUpScreen(),
        routes: const [],
      ),
      GoRoute(
        name: LogInScreen.routeName,
        path: LogInScreen.routeUrl,
        builder: (context, state) => const LogInScreen(),
      ),
      GoRoute(
        name: InterestsScreen.routeName,
        path: InterestsScreen.routeUrl,
        builder: (context, state) => const InterestsScreen(),
      ),
      GoRoute(
        name: MainNavigationScreen.routeName,
        path: "/:tab(home|discover|inbox|profile)",
        builder: (context, state) {
          final tab = state.params["tab"]!;
          return MainNavigationScreen(tab: tab);
        },
      ),
      GoRoute(
        name: ActivityScreen.routeName,
        path: ActivityScreen.routeUrl,
        builder: (context, state) => const ActivityScreen(),
      ),
      GoRoute(
        name: ChatsScreen.routeName,
        path: ChatsScreen.routeUrl,
        builder: (context, state) => const ChatsScreen(),
        routes: [
          GoRoute(
            path: ChatDetailScreen.routeUrl,
            name: ChatDetailScreen.routeName,
            builder: (context, state) {
              final chatId = state.params["chatId"]!;
              return ChatDetailScreen(chatId: chatId);
            },
          )
        ],
      ),
      GoRoute(
        name: VideoRecordingScreen.routeName,
        path: VideoRecordingScreen.routerUrl,
        pageBuilder: (context, state) => CustomTransitionPage(
          transitionDuration: const Duration(milliseconds: 200),
          child: const VideoRecordingScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final position = Tween(begin: const Offset(0, 1), end: Offset.zero)
                .animate(animation);
            return SlideTransition(
              position: position,
              child: child,
            );
          },
        ),
      )
    ],
  );
});
