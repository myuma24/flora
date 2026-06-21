import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static final TextStyle header = GoogleFonts.dmSerifDisplay(
    fontSize: 32.0,
    fontWeight: FontWeight.w400,
    color: Colors.black,
    letterSpacing: 32.0 * 0,
    height: 1.15,
  );

  static final TextStyle subHeader = GoogleFonts.dmSerifDisplay(
    fontSize: 24.0,
    fontWeight: FontWeight.w400,
    color: Colors.black,
    letterSpacing: 20.0 * -0.02,
    height: 0.88,
  );

  static final TextStyle dmSansHeader = GoogleFonts.dmSans(
    fontSize: 16.0,
    fontWeight: FontWeight.w600,
    color: Colors.black,
    letterSpacing: 16.0 * -0.02,
    height: 1.4,
  );

  static final TextStyle bodySans = GoogleFonts.dmSans(
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    color: Colors.black,
    letterSpacing: 14.0 * 0.02,
    height: 1.4,
  );

  static final TextStyle subBodySans = GoogleFonts.dmSans(
    fontSize: 12.0,
    fontWeight: FontWeight.w400,
    color: Colors.black,
    letterSpacing: 12.0 * -0.01,
    height: 1.4,
  );

  static final TextStyle subBodySmall = GoogleFonts.dmSans(
    fontSize: 10.0,
    fontWeight: FontWeight.w400,
    color: Colors.black,
    letterSpacing: 10.0 * -0.01,
    height: 1.4,
  );

  static final TextStyle labelMono = GoogleFonts.dmMono(
    fontSize: 10.0,
    fontWeight: FontWeight.w400,
    color: Colors.black,
    letterSpacing: 10.0 * 0,
  );

  // sub label lighter
  // Colors(DACFC0)

  static final TextStyle labelSans = GoogleFonts.dmMono(
    fontSize: 10.0,
    fontWeight: FontWeight.w400,
    color: Colors.black,
    letterSpacing: 10.0 * -0.01,
    height: 1.4,
  );
}
