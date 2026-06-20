import 'package:flora/core/theme/app_colors.dart';
import 'package:flora/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class CategoryChip extends StatefulWidget {
  final String? label;

  const CategoryChip({super.key, this.label});

  @override
  State<CategoryChip> createState() => _CategoryChipState();
}

class _CategoryChipState extends State<CategoryChip> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: AppColors.strokeColor),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget.label != null)
            Text(
              widget.label!,
              style: AppTextStyles.subBodySans.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: 14.0,
              ),
            ),
        ],
      ),
    );
  }
}
