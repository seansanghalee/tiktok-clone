import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/features/authentication/repos/authentication_repo.dart';
import 'package:tiktok_clone/features/onboarding/interests_screen.dart';
import 'package:tiktok_clone/utils.dart';

class SignUpViewModel extends AsyncNotifier {
  late AuthenticationRepository _authRepo;
  @override
  FutureOr build() {
    _authRepo = ref.read(authRepo);
  }

  Future<void> signUp(BuildContext context) async {
    state = const AsyncValue.loading();
    final form = ref.read(signUpForm);
    state = await AsyncValue.guard(
      () async => await _authRepo.signUp(
        form["email"],
        form["password"],
      ),
    );

    if (!context.mounted) {
      return;
    }

    if (state.hasError) {
      showFirebaseErrorSnack(context, state.error!);
    } else {
      context.goNamed(InterestsScreen.routeName);
    }
  }
}

final signUpForm = StateProvider((ref) => {});
final signUpProvier = AsyncNotifierProvider<SignUpViewModel, void>(
  () => SignUpViewModel(),
);
