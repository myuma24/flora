import 'package:flora/constants/app_colors.dart';
import 'package:flora/widgets/bottom_nav/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeLayoutPage extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const HomeLayoutPage({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pageBackground,
      extendBody: true,
      body: navigationShell,
      bottomNavigationBar: BottomNav(navigationShell: navigationShell),
    );
  }
}
