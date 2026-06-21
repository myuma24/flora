import 'package:flora/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum AppIconSize {
  small,
  defaultSize,
}

class AppIcon extends StatelessWidget {
  final String type;
  final bool alert;
  final AppIconSize size;
  final bool active;
  final bool iconOnly;
  final Color? color;
  final double? overrideSize;
  final Color? fillColor;
  final Color? strokeColor;

  const AppIcon(
    this.type, {
    super.key,
    this.alert = false,
    this.size = AppIconSize.defaultSize,
    this.active = true,
    this.iconOnly = false,
    this.color,
    this.overrideSize,
    this.fillColor,
    this.strokeColor,
  });

  @override
  Widget build(BuildContext context) {
    final double iconSize;
    final double containerSize;

    if (overrideSize != null) {
      containerSize = overrideSize!;
      iconSize = iconOnly ? overrideSize! : overrideSize! * 0.6; // Scale internal icon proportionally unless iconOnly is true
    } else {
      iconSize = size == AppIconSize.small ? 14.0 : 24.0;
      containerSize = iconOnly 
          ? iconSize 
          : (size == AppIconSize.small ? 24.0 : 40.0);
    }

    final Color backgroundColor = fillColor ?? (active ? Colors.white : AppColors.offWhite);
    final Color borderStrokeColor = strokeColor ?? AppColors.strokeColor;

    return Container(
      width: containerSize,
      height: containerSize,
      decoration: iconOnly
          ? null
          : BoxDecoration(
              color: backgroundColor,
              shape: BoxShape.circle,
              border: borderStrokeColor == Colors.transparent
                  ? null
                  : Border.all(
                      color: borderStrokeColor,
                      width: 1.0,
                    ),
            ),
      alignment: Alignment.center,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SvgPicture.asset(
            'assets/icons/$type.svg',
            width: iconSize,
            height: iconSize,
            colorFilter: color != null 
                ? ColorFilter.mode(color!, BlendMode.srcIn) 
                : null,
          ),
          if (alert)
            Positioned(
              top: iconOnly ? 0.0 : (size == AppIconSize.small ? 4.0 : 8.0),
              right: iconOnly ? 0.0 : (size == AppIconSize.small ? 4.0 : 8.0),
              child: Container(
                width: size == AppIconSize.small ? 6.0 : 8.0,
                height: size == AppIconSize.small ? 6.0 : 8.0,
                decoration: const BoxDecoration(
                  color: Color(0xFFF4405F),
                  shape: BoxShape.circle,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
