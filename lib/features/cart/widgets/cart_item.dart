import 'package:flora/core/theme/app_colors.dart';
import 'package:flora/core/theme/app_text_styles.dart';
import 'package:flora/core/widgets/app_icon.dart';
import 'package:flora/core/widgets/compact_quantity.dart';
import 'package:flutter/material.dart';

class CartItem extends StatefulWidget {
  final String imagePath;
  final String name;
  final String pricePerStem;
  final String totalPrice;
  final int initialQuantity;
  final bool hasDiscount;

  const CartItem({
    super.key,
    required this.imagePath,
    required this.name,
    required this.pricePerStem,
    required this.totalPrice,
    this.initialQuantity = 1,
    this.hasDiscount = false,
  });

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  late int _quantity;

  @override
  void initState() {
    super.initState();
    _quantity = widget.initialQuantity;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.0),
        border: Border.all(color: AppColors.strokeColor),
      ),
      child: Column(
        children: [
          // Top Row: Image, Details, Total Price
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.asset(
                  widget.imagePath,
                  width: 56.0,
                  height: 56.0,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.name,
                      style: AppTextStyles.bodySans.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "\$${widget.pricePerStem} / stem",
                      style: AppTextStyles.subBodySmall.copyWith(
                        color: AppColors.subLabelDarker,
                      ),
                    ),
                    if (widget.hasDiscount) ...[
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
                          const SizedBox(width: 4.0),
                          Text(
                            "10% off bulk discount",
                            style: AppTextStyles.labelSans.copyWith(
                              color: AppColors.primaryPink,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ],
                ),
              ),
              Text(
                "\$${widget.totalPrice}",
                style: AppTextStyles.bodySans.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          // Bottom Row: Quantity Selector
          Container(
            padding: const EdgeInsets.fromLTRB(16.0, 8.0, 8.0, 8.0),
            decoration: BoxDecoration(
              color: AppColors.background, // beige pill
              borderRadius: BorderRadius.circular(999.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Quantity",
                  style: AppTextStyles.subBodySans.copyWith(
                    fontSize: 11.0,
                    fontWeight: FontWeight.w600,
                    color: AppColors.subLabelDarker,
                  ),
                ),
                CompactQuantity(
                  quantity: _quantity,
                  onChanged: (newQuantity) {
                    setState(() {
                      _quantity = newQuantity;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
