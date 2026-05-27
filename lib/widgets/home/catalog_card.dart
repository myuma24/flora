import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CatalogCard extends StatefulWidget {
  final String title;

  const CatalogCard({super.key, required this.title});

  @override
  State<CatalogCard> createState() => _CatalogCardState();
}

class _CatalogCardState extends State<CatalogCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 76.0,
          height: 76.0,
          decoration: BoxDecoration(
            color: Color(
              0xFF959595,
            ), // Added a placeholder color so you can see the circle!
            borderRadius: BorderRadius.circular(999.0),
          ),
        ),

        const SizedBox(height: 8.0),

        Text(
          widget.title,
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            letterSpacing: 14 * 0.00_97,
            height: 1.4,
          ),
        ),
      ],
    );
  }
}
