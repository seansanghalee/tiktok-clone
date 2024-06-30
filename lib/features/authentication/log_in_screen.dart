import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/features/authentication/log_in_form_screen.dart';
import 'package:tiktok_clone/features/authentication/view_models/social_auth_vm.dart';
import 'package:tiktok_clone/features/authentication/widgets/authentication_button.dart';

import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class LogInScreen extends ConsumerWidget {
  static const routeUrl = "/login";
  static const routeName = "login";
  const LogInScreen({super.key});

  void onLogInTap(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const LogInFormScreen(),
      ),
    );
  }

  void onSignUpTap(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size40,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Gaps.v80,
              const Text(
                "Log in to TikTok",
                style: TextStyle(
                  fontSize: Sizes.size28,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Gaps.v20,
              const Text(
                "Manage your account, check notifications, comment on videos, and more.",
                style: TextStyle(
                  fontSize: Sizes.size16,
                  color: Colors.black45,
                ),
                textAlign: TextAlign.center,
              ),
              Gaps.v40,
              AuthenticationButton(
                icon: const FaIcon(FontAwesomeIcons.user),
                text: "Use phone / email / username",
                onTap: onLogInTap,
              ),
              Gaps.v16,
              AuthenticationButton(
                icon: const FaIcon(FontAwesomeIcons.github),
                text: "Continue with GitHub",
                onTap: (context) {
                  ref.read(socialAuthProvider.notifier).githubSignIn(context);
                },
              ),
              Gaps.v16,
              AuthenticationButton(
                icon: const FaIcon(FontAwesomeIcons.google),
                text: "Continue with Google",
                onTap: (context) {},
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: Sizes.size32,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Dont' have an account?"),
              Gaps.h5,
              GestureDetector(
                onTap: () => onSignUpTap(context),
                child: Text(
                  "Sign up",
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
