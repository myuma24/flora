import 'package:flora/core/theme/app_colors.dart';
import 'package:flora/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductCard extends StatelessWidget {
  final String category;
  final String name;
  final String originalPrice;
  final String salePrice;
  final String imagePath;

  const ProductCard({
    super.key,
    required this.category,
    required this.name,
    required this.originalPrice,
    required this.salePrice,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push('/product-detail?name=${Uri.encodeComponent(name)}');
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFFFFDFA),
          border: Border.all(color: AppColors.strokeColor, width: 1.0),
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 148.0,
                height: 148.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: AssetImage(imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              const SizedBox(height: 12.0),

              Text(category, style: AppTextStyles.labelSans),

              const SizedBox(height: 2.0),

              Text(
                name,
                style: AppTextStyles.bodySans.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),

              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    "\$$salePrice/stem",
                    style: GoogleFonts.dmSans(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w600,
                      height: 1.4,
                      letterSpacing: 12.0 * -0.01,
                      color: const Color(0xFF817874),
                    ),
                  ),
                  if (originalPrice != salePrice) ...[
                    const SizedBox(width: 4.0),
                    Text(
                      "\$$originalPrice",
                      style: GoogleFonts.dmSans(
                        fontSize: 10.0,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 10.0 * -0.01,
                        height: 1.40,
                        decoration: TextDecoration.lineThrough,
                        decorationColor: const Color(0xFFD7B6BC),
                        color: const Color(0xFFD7B6BC),
                      ),
                    ),
                  ],
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
