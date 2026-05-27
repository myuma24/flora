import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductCard extends StatelessWidget {
  final String category;
  final String name;
  final String originalPrice;
  final String salePrice;

  const ProductCard({
    super.key,
    required this.category,
    required this.name,
    required this.originalPrice,
    required this.salePrice,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 148.0,
          height: 148.0,
          decoration: BoxDecoration(
            color: Color(0xFFACACAC),
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),

        const SizedBox(height: 12.0),

        Text(
          category,
          style: GoogleFonts.inter(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            letterSpacing: 12 * 0.00,
            height: 1.40,
            color: Color(0x99000000),
          ),
        ),

        const SizedBox(height: 2.0),

        Text(
          name,
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            letterSpacing: 14 * 0.00,
            height: 1.40,
          ),
        ),

        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              "\$$salePrice",
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                letterSpacing: 14 * 0.00,
                height: 1.40,
              ),
            ),
            if (originalPrice != salePrice) ...[
              SizedBox(width: 4.0),
              Text(
                "\$$originalPrice",
                style: GoogleFonts.inter(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 14 * 0.00,
                  height: 1.40,
                  decoration: TextDecoration.lineThrough,
                  color: Color(0xffA9A9A9),
                ),
              ),
            ],
          ],
        ),
      ],
    );
  }
}
