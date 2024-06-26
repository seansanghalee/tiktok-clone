import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';

class NavigationTab extends StatelessWidget {
  final IconData icon;
  final IconData selectedIcon;
  final int selectedIndex;
  final String text;
  final bool isSelected;
  final Function onTap;

  const NavigationTab({
    super.key,
    required this.icon,
    required this.selectedIcon,
    required this.selectedIndex,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => onTap(),
      child: AnimatedOpacity(
        opacity: isSelected ? 1 : 0.6,
        duration: const Duration(milliseconds: 300),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FaIcon(
              isSelected ? selectedIcon : icon,
              color: selectedIndex == 0 ? Colors.white : Colors.black,
            ),
            Gaps.v5,
            Text(
              text,
              style: TextStyle(
                color: selectedIndex == 0 ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
