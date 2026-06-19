import 'dart:ui';
import 'package:flora/constants/app_colors.dart';
import 'package:flora/constants/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum AppButtonType { primary, secondary, skip, edit }

class AppButton extends StatefulWidget {
  final String text;
  final VoidCallback? onPressed;
  final AppButtonType type;
  final bool active;
  final Widget? trailingIcon;

  const AppButton({
    super.key,
    required this.text,
    this.onPressed,
    this.type = AppButtonType.primary,
    this.active = true,
    this.trailingIcon,
  });

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final bool isEnabled = widget.active && widget.onPressed != null;

    // Define colors based on button type and state
    Color backgroundColor;
    Color textColor;
    BorderSide borderSide = BorderSide.none;
    bool isDashedBorder = false;

    switch (widget.type) {
      case AppButtonType.primary:
        if (!isEnabled) {
          // Disabled (2nd button in top row)
          backgroundColor = const Color(0xFFE2DBD4);
          textColor = AppColors.offWhite;
        } else if (_isHovered) {
          // Hover (5th button / bottom-left)
          backgroundColor = const Color(0xFFD72F4B);
          textColor = AppColors.offWhite;
        } else {
          // Active/Normal (1st button / top-left)
          backgroundColor = AppColors.primaryPink;
          textColor = AppColors.offWhite;
        }
        break;

      case AppButtonType.secondary:
        if (!isEnabled) {
          backgroundColor = const Color(0xFFE2DDD5);
          textColor = AppColors.offWhite;
        } else if (_isHovered) {
          backgroundColor = const Color(0xFF383838);
          textColor = AppColors.offWhite;
        } else {
          // Active (6th & 7th buttons)
          backgroundColor = AppColors.floraBlack;
          textColor = AppColors.offWhite;
        }
        break;

      case AppButtonType.skip:
        backgroundColor = Colors.transparent;
        textColor = AppColors.subLabelDarker; // Brownish-grey
        isDashedBorder = true; // Handled by DashedStadiumPainter
        break;

      case AppButtonType.edit:
        backgroundColor = _isHovered
            ? const Color(0x0A000000)
            : Colors.transparent;
        textColor = AppColors.floraBlack;
        borderSide = const BorderSide(color: AppColors.strokeColor, width: 1.0);
        break;
    }

    // Apply overall opacity if disabled for skip/edit types (since they are outline/transparent)
    final double opacity = isEnabled ? 1.0 : 0.5;

    // Compute text style based on button type
    TextStyle textStyle;
    if (widget.type == AppButtonType.edit) {
      // Small edit button gets subBodySans with no modifiers
      textStyle = AppTextStyles.subBodySans.copyWith(color: textColor);
    } else {
      // Big buttons get DM Sans, SemiBold, font size 14, line height 88%, letter spacing -2%
      textStyle = GoogleFonts.dmSans(
        fontSize: 14.0,
        fontWeight: FontWeight.w600, // SemiBold is w600
        height: 0.88,
        letterSpacing: 14.0 * -0.02,
        color: textColor,
      );
    }

    Widget buttonContent = Opacity(
      opacity: opacity,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(widget.text, style: textStyle),
          if (widget.trailingIcon != null) ...[
            const SizedBox(width: 8.0),
            widget.trailingIcon!,
          ],
        ],
      ),
    );

    // Padding settings (Edit button has 6 top/bottom, 12 left/right; big buttons have 12 vertical, 16 horizontal)
    final EdgeInsets padding = widget.type == AppButtonType.edit
        ? const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0)
        : const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0);

    Widget container;

    if (isDashedBorder) {
      container = CustomPaint(
        painter: DashedStadiumPainter(
          color: AppColors.strokeColor,
          strokeWidth: 1.0,
          dashWidth: 4.0,
          dashGap: 4.0,
        ),
        child: Container(padding: padding, child: buttonContent),
      );
    } else {
      container = Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(999.0),
          border: borderSide != BorderSide.none
              ? Border.fromBorderSide(borderSide)
              : null,
        ),
        padding: padding,
        child: buttonContent,
      );
    }

    return MouseRegion(
      onEnter: (_) {
        if (isEnabled) {
          setState(() {
            _isHovered = true;
          });
        }
      },
      onExit: (_) {
        if (isEnabled) {
          setState(() {
            _isHovered = false;
          });
        }
      },
      cursor: isEnabled ? SystemMouseCursors.click : SystemMouseCursors.basic,
      child: GestureDetector(
        onTap: isEnabled ? widget.onPressed : null,
        child: container,
      ),
    );
  }
}

class DashedStadiumPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double dashWidth;
  final double dashGap;

  DashedStadiumPainter({
    required this.color,
    this.strokeWidth = 1.0,
    this.dashWidth = 4.0,
    this.dashGap = 4.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final RRect rrect = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Radius.circular(size.height / 2),
    );

    final Path path = Path()..addRRect(rrect);
    final Path dashedPath = _buildDashedPath(path, dashWidth, dashGap);
    canvas.drawPath(dashedPath, paint);
  }

  Path _buildDashedPath(Path source, double dashWidth, double dashGap) {
    final Path dest = Path();
    for (final PathMetric metric in source.computeMetrics()) {
      double distance = 0.0;
      bool draw = true;
      while (distance < metric.length) {
        final double len = draw ? dashWidth : dashGap;
        if (draw) {
          dest.addPath(
            metric.extractPath(distance, distance + len),
            Offset.zero,
          );
        }
        distance += len;
        draw = !draw;
      }
    }
    return dest;
  }

  @override
  bool shouldRepaint(covariant DashedStadiumPainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.strokeWidth != strokeWidth ||
        oldDelegate.dashWidth != dashWidth ||
        oldDelegate.dashGap != dashGap;
  }
}
