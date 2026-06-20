import 'package:flutter/material.dart';
import 'package:flora/core/widgets/app_icon.dart';
import 'package:google_fonts/google_fonts.dart';

class NavButton extends StatelessWidget {
  final String icon;
  final String label;
  final bool selected;

  const NavButton({
    super.key,
    required this.icon,
    required this.label,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    const textColor = Color(0xFFD7D3CF);

    if (selected) {
      return Container(
        decoration: BoxDecoration(
          color: const Color(0xFF353535),
          borderRadius: BorderRadius.circular(999.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppIcon(icon, color: textColor, overrideSize: 16.0),
              const SizedBox(width: 8.0),
              Text(
                label,
                style: GoogleFonts.googleSansFlex(
                  color: textColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return AppIcon(icon, color: textColor, overrideSize: 16.0);
    }
  }
}
