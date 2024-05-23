import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class AuthenticationFormButton extends StatelessWidget {
  final bool disabled;
  final String text;

  const AuthenticationFormButton({
    super.key,
    required this.disabled,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(
          vertical: Sizes.size16,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              Sizes.size5,
            ),
            color: disabled
                ? Colors.grey.shade300
                : Theme.of(context).primaryColor),
        child: AnimatedDefaultTextStyle(
          style: TextStyle(
            color: disabled ? Colors.grey : Colors.white,
            fontWeight: FontWeight.w600,
          ),
          duration: const Duration(milliseconds: 300),
          child: Text(
            text,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
