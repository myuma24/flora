import 'package:flora/core/theme/app_colors.dart';
import 'package:flora/core/theme/app_text_styles.dart';
import 'package:flora/core/widgets/button.dart';
import 'package:flutter/material.dart';

class MarketingCard extends StatelessWidget {
  const MarketingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.floraBlack,
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header Row: Dot + Title (left) & Hide (right)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 8.0,
                      height: 8.0,
                      decoration: const BoxDecoration(
                        color: AppColors.primaryPink,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    Text(
                      "Flora’s May Deal",
                      style: AppTextStyles.labelMono.copyWith(
                        color: AppColors.offWhite,
                      ),
                    ),
                  ],
                ),
                Text(
                  "× Hide",
                  style: AppTextStyles.labelSans.copyWith(
                    color: Color(0xFFA7A29B),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),

            // Title Text
            Text(
              "20% Off Peonies",
              style: AppTextStyles.subHeader.copyWith(
                color: AppColors.offWhite,
              ),
            ),
            const SizedBox(height: 12.0),

            // Body Text
            Text(
              "Get 20% off all peonies when you purchase three or more. Use promo code 2OFLORA.",
              style: AppTextStyles.subBodySmall.copyWith(
                color: AppColors.offWhite,
              ),
            ),
            const SizedBox(height: 24.0),

            // Footer Row: Date & Buy Now Button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Ends 5/31 • View Terms",
                  style: AppTextStyles.labelSans.copyWith(
                    color: AppColors.subLabelLighter,
                  ),
                ),
                AppButton(
                  text: "Buy Now",
                  type: AppButtonType.primary,
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

