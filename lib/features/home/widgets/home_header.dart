import 'package:flora/core/theme/app_text_styles.dart';
import 'package:flora/core/widgets/app_icon.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({super.key});

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Welcome back,", style: AppTextStyles.labelMono),
              Text("Avery", style: AppTextStyles.header),
            ],
          ),
        ),
        GestureDetector(
          onTap: () => context.push('/search'),
          child: const AppIcon("search_new"),
        ),
        const SizedBox(width: 8.0),
        const AppIcon("notif"),
      ],
    );
  }
}
