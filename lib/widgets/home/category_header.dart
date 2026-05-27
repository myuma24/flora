import 'package:flora/widgets/app_icon.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryHeader extends StatefulWidget {
  final String title;

  const CategoryHeader({super.key, required this.title});

  @override
  State<CategoryHeader> createState() => _CategoryHeaderState();
}

class _CategoryHeaderState extends State<CategoryHeader> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Text(
            widget.title,
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              letterSpacing: 16 * -0.02,
              height: 1.40,
            ),
          ),
          const SizedBox(width: 10.0),
          AppIcon("chevron", size: 20.0),
        ],
      ),
    );
  }
}
