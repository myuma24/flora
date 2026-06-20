import 'package:flora/core/theme/app_colors.dart';
import 'package:flora/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class ProductOptionPill extends StatelessWidget {
  final String label;
  final List<Color> colors;
  final bool isSelected;
  final VoidCallback? onTap;

  const ProductOptionPill({
    super.key,
    required this.label,
    required this.colors,
    this.isSelected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
        color: AppColors.offWhite,
        border: Border.all(
          color: isSelected ? AppColors.primaryPink : AppColors.strokeColor,
          width: isSelected ? 2.0 : 1.0,
        ),
        borderRadius: BorderRadius.circular(999.0),
      ),
      padding: EdgeInsets.only(
        left: isSelected ? 3.0 : 4.0,
        top: isSelected ? 3.0 : 4.0,
        bottom: isSelected ? 3.0 : 4.0,
        right: isSelected ? 9.0 : 10.0,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 21.0,
            height: 21.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: colors.length == 1 && colors.first == Colors.white
                  ? Border.all(color: AppColors.strokeColor)
                  : null,
              gradient: colors.length > 1
                  ? LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: const [0.0, 0.45, 0.45, 0.55, 0.55, 1.0],
                      colors: [
                        colors[0],
                        colors[0],
                        Colors.white,
                        Colors.white,
                        colors[1],
                        colors[1],
                      ],
                    )
                  : null,
              color: colors.length == 1 ? colors.first : null,
            ),
          ),
          const SizedBox(width: 8.0),
          Text(
            label,
            style: AppTextStyles.labelSans.copyWith(
              color: AppColors.floraBlack,
            ),
          ),
        ],
      ),
      ),
    );
  }
}
