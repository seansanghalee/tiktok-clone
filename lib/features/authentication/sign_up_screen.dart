import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/features/authentication/widgets/authentication_button.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/utils.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  void onLogInTap(BuildContext context) {
    context.push("/login");
  }

  void onUsernameTap(BuildContext context) {
    context.push("/username");
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) => Scaffold(
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
                  "Sign up for TikTok",
                  style: TextStyle(
                    fontSize: Sizes.size28,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Gaps.v20,
                Text(
                  "Create a profile, follow other accounts, make your own videos, and more.",
                  style: TextStyle(
                    fontSize: Sizes.size16,
                    color: isDarkMode(context)
                        ? Colors.grey.shade300
                        : Colors.black45,
                  ),
                  textAlign: TextAlign.center,
                ),
                Gaps.v40,
                AuthenticationButton(
                  icon: const FaIcon(FontAwesomeIcons.user),
                  text: "Use phone or email",
                  onTap: onUsernameTap,
                ),
                Gaps.v16,
                AuthenticationButton(
                  icon: const FaIcon(FontAwesomeIcons.facebook),
                  text: "Continue with Facebook",
                  onTap: (context) {},
                ),
                Gaps.v16,
                AuthenticationButton(
                  icon: const FaIcon(FontAwesomeIcons.apple),
                  text: "Continue with Apple",
                  onTap: (context) {},
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
                const Text("Already have an account?"),
                Gaps.h5,
                GestureDetector(
                  onTap: () => onLogInTap(context),
                  child: Text(
                    "Log in",
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
