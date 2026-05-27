import 'package:flora/constants/app_colors.dart';
import 'package:flora/widgets/app_icon.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeSearchBar extends StatefulWidget {
  const HomeSearchBar({super.key});

  @override
  State<HomeSearchBar> createState() => _HomeSearchBarState();
}

class _HomeSearchBarState extends State<HomeSearchBar> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: GoogleFonts.inter(fontSize: 16, letterSpacing: 16 * -0.02),
      decoration: InputDecoration(
        isDense: true, // Tells Flutter to ignore default minimum heights
        hintText: "Search for flowers...",
        hintStyle: const TextStyle(fontSize: 16),

        // By default, Flutter forces prefixIcons to be 48x48 minimum.
        // We can override that with prefixIconConstraints!
        prefixIconConstraints: const BoxConstraints(
          minWidth: 40,
          minHeight: 40,
        ),
        prefixIcon: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: AppIcon("search"),
        ),

        filled: true,
        fillColor: AppColors.bgSecondary,

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),

        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      ),
    );
  }
}
