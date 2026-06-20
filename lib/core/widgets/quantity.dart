import 'package:flora/core/theme/app_colors.dart';
import 'package:flora/core/widgets/app_icon.dart';
import 'package:flora/core/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuantitySelector extends StatefulWidget {
  final String buttonText;
  final bool disabled;
  final ValueChanged<int>? onButtonPressed;

  const QuantitySelector({
    super.key,
    required this.buttonText,
    this.disabled = false,
    this.onButtonPressed,
  });

  @override
  State<QuantitySelector> createState() => _QuantitySelectorState();
}

class _QuantitySelectorState extends State<QuantitySelector> {
  int _quantity = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.0),
        border: Border.all(color: AppColors.strokeColor),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Quantity selector controls wrapped in a pill-shaped container
          // padding is not applied to this container as the gesture detectors are expanded with panding
          // to make the interaction zone larger.
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFFF7F2EC),
              borderRadius: BorderRadius.circular(999.0),
            ),
            width:
                100, // this lets the quantity extend to double digits and prevents small font variations from changing width
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Visual elements Row
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 6.5,
                      ),
                      child: AppIcon(
                        "minus",
                        size: AppIconSize.small,
                        active: _quantity > 0 && !widget.disabled,
                        color: (_quantity > 0 && !widget.disabled)
                            ? AppColors.floraBlack
                            : AppColors.subLabelLighter,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "$_quantity",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.dmSans(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                          color: AppColors.floraBlack,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 6.5,
                      ),
                      child: const AppIcon(
                        "plus",
                        size: AppIconSize.small,
                        fillColor: AppColors.primaryPink,
                        strokeColor: Colors.transparent,
                        color: AppColors.offWhite,
                      ),
                    ),
                  ],
                ),
                // Decrement overlay (left half)
                Positioned(
                  left: 0,
                  top: 0,
                  bottom: 0,
                  width: 50,
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: (widget.disabled || _quantity == 0)
                        ? null
                        : () {
                            setState(() {
                              _quantity--;
                            });
                          },
                    child: const SizedBox.expand(),
                  ),
                ),
                // Increment overlay (right half)
                Positioned(
                  right: 0,
                  top: 0,
                  bottom: 0,
                  width: 50,
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: widget.disabled
                        ? null
                        : () {
                            setState(() {
                              _quantity++;
                            });
                          },
                    child: const SizedBox.expand(),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16.0),
          // Expanded Button
          Expanded(
            child: AppButton(
              text: widget.buttonText,
              type: AppButtonType.primary,
              active: !widget.disabled && _quantity > 0,
              onPressed: (widget.disabled || _quantity == 0)
                  ? null
                  : () {
                      if (widget.onButtonPressed != null) {
                        widget.onButtonPressed!(_quantity);
                      }
                    },
            ),
          ),
        ],
      ),
    );
  }
}
