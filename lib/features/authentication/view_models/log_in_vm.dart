import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/features/authentication/repos/authentication_repo.dart';
import 'package:tiktok_clone/utils.dart';

class LogInViewModel extends AsyncNotifier<void> {
  late final AuthenticationRepository _repository;
  @override
  FutureOr<void> build() {
    _repository = ref.read(authRepo);
  }

  Future<void> logIn(
      String email, String password, BuildContext context) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () => _repository.signIn(email, password),
    );

    if (!context.mounted) {
      return;
    }

    if (state.hasError) {
      showFirebaseErrorSnack(context, state.error!);
    } else {
      context.go("/home");
    }
  }
}

final logInProvider = AsyncNotifierProvider<LogInViewModel, void>(
  () => LogInViewModel(),
);
