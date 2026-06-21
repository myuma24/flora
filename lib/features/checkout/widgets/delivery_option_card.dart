import 'package:flora/core/theme/app_colors.dart';
import 'package:flora/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class DeliveryOptionCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String description;
  final String emoji;
  final List<Widget> badges;
  final bool isSelected;
  final bool isDark; // Permanent style for the card
  final Color? subtitleColor;
  final VoidCallback onTap;

  const DeliveryOptionCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.emoji,
    required this.badges,
    required this.isSelected,
    required this.isDark,
    required this.onTap,
    this.subtitleColor,
  });

  @override
  Widget build(BuildContext context) {
    final bgColor = isDark ? AppColors.floraBlack : Colors.white;
    final textColor = isDark ? Colors.white : AppColors.floraBlack;
    final defaultSubtitleColor = isDark
        ? AppColors.subLabelLighter
        : AppColors.primaryPink;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: isSelected
            ? const EdgeInsets.all(23.0) // to account for 2px thick border
            : const EdgeInsets.all(24.0),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(16.0),
          border: isSelected
              ? Border.all(color: AppColors.primaryPink, width: 2.0)
              : Border.all(
                  color: isDark ? Colors.transparent : AppColors.strokeColor,
                  width: 1.0, // Match width to prevent layout shift
                ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Subtitle and Emoji row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      subtitle,
                      style: AppTextStyles.labelSans.copyWith(
                        color: subtitleColor ?? defaultSubtitleColor,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Text(
                      title,
                      style: AppTextStyles.subHeader.copyWith(color: textColor),
                    ),
                  ],
                ),
                Text(
                  emoji,
                  style: const TextStyle(fontSize: 38.0), // Large emoji
                ),
              ],
            ),
            const SizedBox(height: 16.0),

            // Description
            Text(
              description,
              style: AppTextStyles.subBodySmall.copyWith(
                color: isDark ? AppColors.offWhite : AppColors.floraBlack,
              ),
            ),
            const SizedBox(height: 16.0),

            // Badges
            Wrap(spacing: 8.0, runSpacing: 8.0, children: badges),
          ],
        ),
      ),
    );
  }
}
