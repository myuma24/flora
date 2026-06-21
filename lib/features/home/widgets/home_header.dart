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
          child: const AppIcon("search_new", overrideSize: 32.0),
        ),
        const SizedBox(width: 8.0),
        const AppIcon("notif", overrideSize: 32.0),
      ],
    );
    // return TextField(
    //   style: GoogleFonts.inter(fontSize: 16, letterSpacing: 16 * -0.02),
    //   decoration: InputDecoration(
    //     isDense: true, // Tells Flutter to ignore default minimum heights
    //     hintText: "Search for flowers...",
    //     hintStyle: const TextStyle(fontSize: 16),

    //     // By default, Flutter forces prefixIcons to be 48x48 minimum.
    //     // We can override that with prefixIconConstraints!
    //     prefixIconConstraints: const BoxConstraints(
    //       minWidth: 40,
    //       minHeight: 40,
    //     ),
    //     prefixIcon: const Padding(
    //       padding: EdgeInsets.symmetric(horizontal: 12),
    //       child: AppIcon("search"),
    //     ),

    //     filled: true,
    //     fillColor: AppColors.bgSecondary,

    //     border: OutlineInputBorder(
    //       borderRadius: BorderRadius.circular(8),
    //       borderSide: BorderSide.none,
    //     ),

    //     contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    //   ),
    // );
  }
}
