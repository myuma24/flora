import 'package:flora/core/theme/app_colors.dart';
import 'package:flora/core/theme/app_text_styles.dart';
import 'package:flora/core/widgets/button.dart';
import 'package:flora/features/checkout/widgets/delivery_badge.dart';
import 'package:flora/features/checkout/widgets/delivery_option_card.dart';
import 'package:flutter/material.dart';

class DeliveryOptionsSheet extends StatefulWidget {
  const DeliveryOptionsSheet({super.key});

  @override
  State<DeliveryOptionsSheet> createState() => _DeliveryOptionsSheetState();
}

class _DeliveryOptionsSheetState extends State<DeliveryOptionsSheet> {
  String selectedOption = 'delivery'; // 'delivery' or 'pickup'

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(24.0, 16.0, 24.0, 24.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.0)),
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Custom Touch Bar
            Center(
              child: Container(
                width: 111.0,
                height: 6.0,
                decoration: BoxDecoration(
                  color: const Color(0xFFE6E0DA),
                  borderRadius: BorderRadius.circular(999.0),
                ),
              ),
            ),
            const SizedBox(height: 24.0),

            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 12.0,
              ),
              child: Text(
                "How would you like\nto get it?",
                style: AppTextStyles.subHeader,
              ),
            ),
            const SizedBox(height: 16.0),

            // Delivery Card
            DeliveryOptionCard(
              title: "Delivery",
              subtitle: "\$5.99 Flat Shipping",
              description:
                  "Delivery as early as tomorrow! Or schedule a day that works for you, we'll accommodate.",
              emoji: "🚚",
              isSelected: selectedOption == 'delivery',
              isDark: true,
              onTap: () => setState(() => selectedOption = 'delivery'),
              badges: const [
                DeliveryBadge(
                  text: "Directly to recipient",
                  emoji: "⛺",
                  isDark: true,
                ),
                DeliveryBadge(
                  text: "Next day delivery",
                  emoji: "📅",
                  isDark: true,
                ),
              ],
            ),
            const SizedBox(height: 16.0),

            // Pickup Card
            DeliveryOptionCard(
              title: "Pickup",
              subtitle: "Save \$5.99",
              description:
                  "Let's locate a florist nearby. Your order could be ready as fast as today!",
              emoji: "📍",
              isSelected: selectedOption == 'pickup',
              isDark: false,
              onTap: () => setState(() => selectedOption = 'pickup'),
              badges: const [
                DeliveryBadge(text: "Ready Today", emoji: "📅", isDark: false),
              ],
            ),
            const SizedBox(height: 32.0),

            // Continue Button
            AppButton(
              text: "Continue",
              type: AppButtonType.primary,
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              backgroundColor: selectedOption.isEmpty
                  ? AppColors.strokeColor
                  : null,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            const SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}
