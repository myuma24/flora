import 'package:flora/core/theme/app_colors.dart';
import 'package:flora/core/theme/app_text_styles.dart';
import 'package:flora/core/widgets/button.dart';
import 'package:flutter/material.dart';

class CartTotals extends StatelessWidget {
  final String subtotal;
  final String discount;
  final String total;

  const CartTotals({
    super.key,
    required this.subtotal,
    required this.discount,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.0),
        boxShadow: const [
          BoxShadow(
            color: Color(0xFFE6E0DA),
            offset: Offset(0, 7),
            blurRadius: 20,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        children: [
          _buildRow("Subtotal", "\$$subtotal"),
          const SizedBox(height: 4.0),
          _buildRow("Discount", "-\$$discount"),
          const SizedBox(height: 4.0),
          _buildRow("Tax", "Calculated at Checkout", isNormalWeight: true),
          const SizedBox(height: 4.0),
          const SizedBox(height: 12.0),
          _buildRow("Total", "\$$total"),
          const SizedBox(height: 16.0),
          const Divider(),
          const SizedBox(height: 16.0),
          // Buttons
          Row(
            children: [
              Expanded(
                child: AppButton(
                  text: "Save for Later",
                  type: AppButtonType.secondary,
                  backgroundColor: AppColors.subLabelLighter,
                  textColor: AppColors.floraBlack,
                  onPressed: () {},
                ),
              ),
              const SizedBox(width: 12.0),
              Expanded(
                child: AppButton(
                  text: "Continue",
                  type: AppButtonType.primary,
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRow(String label, String value, {bool isNormalWeight = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: AppTextStyles.subBodySans.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          value,
          style: isNormalWeight
              ? AppTextStyles.subBodySans.copyWith(color: AppColors.floraBlack)
              : AppTextStyles.subBodySans.copyWith(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
