import 'package:flora/core/theme/app_colors.dart';
import 'package:flora/core/theme/app_text_styles.dart';
import 'package:flora/core/widgets/app_icon.dart';
import 'package:flora/core/widgets/button.dart';
import 'package:flora/features/cart/widgets/cart_item.dart';
import 'package:flora/features/cart/widgets/cart_totals.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Header Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => context.pop(),
                      child: const AppIcon("back_arrow"),
                    ),
                    Text(
                      "My Cart",
                      style: AppTextStyles.dmSansHeader.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const AppIcon("saved", fillColor: Colors.white),
                  ],
                ),
                const SizedBox(height: 24.0),

                // Subheader
                Text(
                  "Bundle your loose stems to start on a second bouquet. Add more or save for it later.",
                  style: AppTextStyles.subBodySans.copyWith(
                    color: AppColors.floraBlack,
                  ),
                ),
                const SizedBox(height: 24.0),

                // Items
                const CartItem(
                  imagePath: "assets/images/peony.png",
                  name: "Peony",
                  pricePerStem: "2.97",
                  totalPrice: "6.98",
                  initialQuantity: 4,
                  hasDiscount: true,
                ),
                const SizedBox(height: 16.0),
                const CartItem(
                  imagePath: "assets/images/white-anenome.png",
                  name: "Rose Lily",
                  pricePerStem: "2.97",
                  totalPrice: "6.98",
                  initialQuantity: 2,
                  hasDiscount: false,
                ),
                const SizedBox(height: 16.0),
                const CartItem(
                  imagePath: "assets/images/alstroemeria.png",
                  name: "Hypericum Berries",
                  pricePerStem: "0.49",
                  totalPrice: "6.98",
                  initialQuantity: 4,
                  hasDiscount: true,
                ),
                const SizedBox(height: 16.0),

                // Create Bundle Button
                AppButton(
                  text: "Create Bundle",
                  type: AppButtonType.skip,
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  fontWeight: FontWeight.w400,
                  onPressed: () {},
                ),
                const SizedBox(height: 46.0),

                // Totals
                const CartTotals(
                  subtotal: "25.20",
                  discount: "5.99",
                  total: "19.21",
                ),
                const SizedBox(height: 24.0),
              ],
            ),
          ),
        ),
      );
  }
}
