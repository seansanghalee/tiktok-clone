import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/features/authentication/view_models/sign_up_vm.dart';
// import 'package:tiktok_clone/features/onboarding/interests_screen.dart';
import 'package:tiktok_clone/features/authentication/widgets/authentication_form_button.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class BirthdayScreen extends ConsumerStatefulWidget {
  const BirthdayScreen({super.key});

  @override
  ConsumerState<BirthdayScreen> createState() => _BirthdayScreenState();
}

class _BirthdayScreenState extends ConsumerState<BirthdayScreen> {
  final TextEditingController _birthdayController = TextEditingController();
  final DateTime _today = DateTime.now();

  @override
  void initState() {
    super.initState();
    _setTextFieldDate(_today);
  }

  @override
  void dispose() {
    _birthdayController.dispose();
    super.dispose();
  }

  void onNextTap() {
    ref.read(signUpProvier.notifier).signUp(context);
  }

  void _setTextFieldDate(DateTime date) {
    final birthdayText = date.toString().split(" ").first;
    _birthdayController.value = TextEditingValue(text: birthdayText);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Sign up",
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 300,
        child: CupertinoDatePicker(
          onDateTimeChanged: _setTextFieldDate,
          mode: CupertinoDatePickerMode.date,
          maximumDate: _today,
          initialDateTime: _today,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.size36),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gaps.v40,
            const Text(
              "When's your birthday?",
              style: TextStyle(
                fontSize: Sizes.size24,
                fontWeight: FontWeight.w700,
              ),
            ),
            Gaps.v8,
            const Text(
              "Your birthday won't be shown publicly.",
              style: TextStyle(
                fontSize: Sizes.size16,
                color: Colors.black54,
              ),
            ),
            Gaps.v16,
            TextField(
              readOnly: true,
              controller: _birthdayController,
              cursorColor: Theme.of(context).primaryColor,
              decoration: InputDecoration(
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
                disabled: ref.watch(signUpProvier).isLoading,
                text: "Next",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
