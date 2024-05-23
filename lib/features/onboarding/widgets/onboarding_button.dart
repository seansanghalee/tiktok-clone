import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class OnboardingButton extends StatelessWidget {
  final String text;

  const OnboardingButton({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size64,
          vertical: Sizes.size12,
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.black,
            fontSize: Sizes.size14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
