import 'package:flora/core/theme/app_colors.dart';
import 'package:flora/core/theme/app_text_styles.dart';
import 'package:flora/core/widgets/app_icon.dart';
import 'package:flutter/material.dart';

class CompactQuantity extends StatelessWidget {
  final int quantity;
  final ValueChanged<int> onChanged;

  const CompactQuantity({
    super.key,
    required this.quantity,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 84.0,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Visual elements Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppIcon(
                "minus",
                size: AppIconSize.small,
                active: quantity > 1,
                color: (quantity > 1)
                    ? AppColors.floraBlack
                    : AppColors.subLabelLighter,
              ),
              Expanded(
                child: Text(
                  "$quantity",
                  textAlign: TextAlign.center,
                  style: AppTextStyles.bodySans.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const AppIcon(
                "plus",
                size: AppIconSize.small,
                fillColor: AppColors.primaryPink,
                strokeColor: Colors.transparent,
                color: Colors.white,
              ),
            ],
          ),
          // Decrement overlay (left half)
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            width: 42.0,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: (quantity == 1)
                  ? null
                  : () {
                      onChanged(quantity - 1);
                    },
              child: const SizedBox.expand(),
            ),
          ),
          // Increment overlay (right half)
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            width: 42.0,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                onChanged(quantity + 1);
              },
              child: const SizedBox.expand(),
            ),
          ),
        ],
      ),
    );
  }
}
