import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/features/authentication/birthday_screen.dart';
import 'package:tiktok_clone/features/authentication/widgets/authentication_form_button.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  String _password = "";
  bool _isPasswordVisible = false;
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(() {
      setState(() {
        _password = _passwordController.text;
      });
    });
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  void onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  void onClearTap() {
    _passwordController.clear();
  }

  void onEyeTap() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  bool _passwordLengthCheck(String password) {
    return password.length >= 8 && password.length <= 20;
  }

  bool _passwordComplexityCheck(String password) {
    final regExp = RegExp(
        r"^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[@$!%*#?&\^])[A-Za-z0-9@$!%*#?&\^]{8,20}$");
    if (!regExp.hasMatch(_password)) {
      return false;
    }
    return true;
  }

  void onNextTap() {
    if (_password.isEmpty) {
      return;
    }
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const BirthdayScreen(),
      ),
    );
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
                "Create password",
                style: TextStyle(
                  fontSize: Sizes.size24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Gaps.v28,
              TextField(
                controller: _passwordController,
                cursorColor: Theme.of(context).primaryColor,
                obscureText: !_isPasswordVisible,
                decoration: InputDecoration(
                  suffixIconColor: Colors.grey.shade500,
                  suffixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: onClearTap,
                        child: const FaIcon(
                          FontAwesomeIcons.circleXmark,
                          size: Sizes.size20,
                        ),
                      ),
                      Gaps.h10,
                      GestureDetector(
                        onTap: onEyeTap,
                        child: FaIcon(
                          _isPasswordVisible
                              ? FontAwesomeIcons.eyeSlash
                              : FontAwesomeIcons.eye,
                          size: Sizes.size20,
                        ),
                      )
                    ],
                  ),
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
              Gaps.v10,
              const Text(
                "Your password must have:",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Gaps.v10,
              Row(
                children: [
                  FaIcon(
                    _passwordLengthCheck(_password)
                        ? FontAwesomeIcons.circleCheck
                        : FontAwesomeIcons.circleXmark,
                    size: Sizes.size18,
                    color: _passwordLengthCheck(_password)
                        ? Colors.green
                        : Colors.red,
                  ),
                  Gaps.h6,
                  const Text("8 to 20 characters"),
                ],
              ),
              Gaps.v10,
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FaIcon(
                    _passwordComplexityCheck(_password)
                        ? FontAwesomeIcons.circleCheck
                        : FontAwesomeIcons.circleXmark,
                    size: Sizes.size18,
                    color: _passwordLengthCheck(_password)
                        ? Colors.green
                        : Colors.red,
                  ),
                  Gaps.h8,
                  const Text("Letters, numbers, and special characters"),
                ],
              ),
              Gaps.v28,
              GestureDetector(
                onTap: onNextTap,
                child: AuthenticationFormButton(
                  disabled: !(_passwordLengthCheck(_password) &&
                      _passwordComplexityCheck(_password)),
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
