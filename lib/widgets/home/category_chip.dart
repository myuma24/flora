import 'package:flora/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flora/widgets/app_icon.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryChip extends StatefulWidget {
  final String? icon;
  final String? label;

  const CategoryChip({super.key, this.icon, this.label});

  @override
  State<CategoryChip> createState() => _CategoryChipState();
}

class _CategoryChipState extends State<CategoryChip> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: AppColors.borderDefault),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget.icon != null) ...[
            AppIcon(widget.icon!, size: 16),
            if (widget.label != null) const SizedBox(width: 8),
          ],
          if (widget.label != null)
            Text(
              widget.label!,
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                height: 22 / 14,
                letterSpacing: 14 * -0.02,
              ),
            ),
        ],
      ),
    );
  }
}
