import 'package:flora/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flora/widgets/app_icon.dart';
import 'package:go_router/go_router.dart';

class BottomNav extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const BottomNav({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.pageBackground,
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(63, 0, 0, 0),
            blurRadius: 5,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () => navigationShell.goBranch(0),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 12.0),
                child: AppIcon("home"),
              ),
            ),
            GestureDetector(
              onTap: () => navigationShell.goBranch(1),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 12.0),
                child: AppIcon("cart-shopping"),
              ),
            ),
            GestureDetector(
              onTap: () => navigationShell.goBranch(2),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 12.0),
                child: AppIcon("order"),
              ),
            ),
            GestureDetector(
              onTap: () => navigationShell.goBranch(3),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 12.0),
                child: AppIcon("message"),
              ),
            ),
            GestureDetector(
              onTap: () => navigationShell.goBranch(4),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 12.0),
                child: AppIcon("profile"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
