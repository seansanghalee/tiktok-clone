import 'package:flutter/material.dart';
import 'package:tiktok_clone/features/authentication/password_screen.dart';
import 'package:tiktok_clone/features/authentication/widgets/authentication_form_button.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class EmailScreenArgs {
  final String username;

  EmailScreenArgs({required this.username});
}

class EmailScreen extends StatefulWidget {
  final String username;

  const EmailScreen({
    super.key,
    required this.username,
  });

  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  final TextEditingController _emailController = TextEditingController();
  String email = "";

  @override
  void initState() {
    super.initState();
    _emailController.addListener(() {
      setState(() {
        email = _emailController.text;
      });
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  void onNextTap() {
    if (email.isEmpty || _isEmailValid() != null) {
      return;
    }
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const PasswordScreen(),
      ),
    );
  }

  String? _isEmailValid() {
    if (email.isEmpty) {
      return null;
    }

    final regExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (!regExp.hasMatch(email)) {
      return "Email not valid";
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onScaffoldTap,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Sign up",
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size36),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gaps.v40,
              const Text(
                "Enter your email",
                style: TextStyle(
                  fontSize: Sizes.size24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Gaps.v16,
              TextField(
                controller: _emailController,
                cursorColor: Theme.of(context).primaryColor,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: "Email",
                  errorText: _isEmailValid(),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade400,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade400,
                    ),
                  ),
                ),
              ),
              Gaps.v28,
              GestureDetector(
                onTap: onNextTap,
                child: AuthenticationFormButton(
                  disabled: email.isEmpty || _isEmailValid() != null,
                  text: "Next",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
