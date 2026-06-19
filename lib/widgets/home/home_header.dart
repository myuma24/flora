import 'package:flora/constants/app_text_styles.dart';
import 'package:flora/widgets/app_icon.dart';
import 'package:flutter/material.dart';

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
        AppIcon("search_new", size: 32.0),
        SizedBox(width: 8.0),
        AppIcon("notif", size: 32.0),
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
