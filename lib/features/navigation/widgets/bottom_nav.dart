import 'package:flutter/material.dart';
import 'package:flora/features/navigation/widgets/nav_button.dart';
import 'package:go_router/go_router.dart';

class BottomNav extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const BottomNav({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    final int currentIndex = navigationShell.currentIndex;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 65.0,
            constraints: const BoxConstraints(maxWidth: 343.0),
            decoration: const BoxDecoration(
              color: Color(0xFF242424),
              borderRadius: BorderRadius.all(Radius.circular(999.0)),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  _buildNavItem(0, "home", "Home", currentIndex),
                  _buildNavItem(1, "build", "Build", currentIndex),
                  _buildNavItem(2, "cart", "Cart", currentIndex),
                  _buildNavItem(3, "chat", "Chat", currentIndex),
                  _buildNavItem(4, "profile", "Profile", currentIndex),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, String icon, String label, int currentIndex) {
    final isSelected = currentIndex == index;
    final navButton = NavButton(icon: icon, label: label, selected: isSelected);

    if (isSelected) {
      return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => navigationShell.goBranch(index),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: navButton,
        ),
      );
    } else {
      return Expanded(
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => navigationShell.goBranch(index),
          child: Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: navButton,
            ),
          ),
        ),
      );
    }
  }
}
