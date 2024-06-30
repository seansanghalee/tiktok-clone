import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone/features/authentication/view_models/log_in_vm.dart';
import 'package:tiktok_clone/features/authentication/widgets/authentication_form_button.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class LogInFormScreen extends ConsumerStatefulWidget {
  const LogInFormScreen({super.key});

  @override
  ConsumerState<LogInFormScreen> createState() => _LogInFormScreenState();
}

class _LogInFormScreenState extends ConsumerState<LogInFormScreen> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  Map<String, String> data = {};

  String? _validateEmail(String? email) {
    return null;
  }

  String? _validatePassword(String? password) {
    return null;
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  void _onLogInTap() {
    // _key.currentState?.validate();
    if (_key.currentState != null) {
      if (_key.currentState!.validate()) {
        _key.currentState!.save();
        ref.read(logInProvider.notifier).logIn(
              data["email"]!,
              data["password"]!,
              context,
            );
        // context.goNamed(InterestsScreen.routeName);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Log in"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size36,
          ),
          child: Form(
              key: _key,
              child: Column(
                children: [
                  Gaps.v28,
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: "Email",
                    ),
                    validator: _validateEmail,
                    onSaved: (newValue) {
                      if (newValue != null) {
                        data["email"] = newValue;
                      }
                    },
                  ),
                  Gaps.v16,
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: "Password",
                    ),
                    validator: _validatePassword,
                    onSaved: (newValue) {
                      if (newValue != null) {
                        data["password"] = newValue;
                      }
                    },
                  ),
                  Gaps.v28,
                  GestureDetector(
                    onTap: _onLogInTap,
                    child: AuthenticationFormButton(
                        disabled: ref.watch(logInProvider).isLoading,
                        text: "Log in"),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
