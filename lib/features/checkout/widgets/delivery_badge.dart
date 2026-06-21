import 'package:flora/core/theme/app_colors.dart';
import 'package:flora/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class DeliveryBadge extends StatelessWidget {
  final String text;
  final String emoji;
  final bool isDark;

  const DeliveryBadge({
    super.key,
    required this.text,
    required this.emoji,
    this.isDark = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkerIconBackground : AppColors.offWhite,
        borderRadius: BorderRadius.circular(999.0),
        border: isDark ? null : Border.all(color: AppColors.strokeColor),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            emoji,
            style: const TextStyle(fontSize: 10.0), // Force emoji size
          ),
          const SizedBox(width: 4.0),
          Text(
            text,
            style: AppTextStyles.subBodySans.copyWith(
              color: isDark ? AppColors.offWhite : AppColors.floraBlack,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
