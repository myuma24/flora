import 'package:flora/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class ProductImageCarousel extends StatefulWidget {
  final List<String> imagePaths;

  const ProductImageCarousel({super.key, required this.imagePaths});

  @override
  State<ProductImageCarousel> createState() => _ProductImageCarouselState();
}

class _ProductImageCarouselState extends State<ProductImageCarousel> {
  int _currentImageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(36.0),
            bottomRight: Radius.circular(36.0),
          ),
          child: SizedBox(
            height: 380.0,
            child: PageView.builder(
              itemCount: widget.imagePaths.length,
              onPageChanged: (index) {
                setState(() {
                  _currentImageIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return Image.asset(
                  widget.imagePaths[index],
                  fit: BoxFit.cover,
                  width: double.infinity,
                );
              },
            ),
          ),
        ),
        // Page Indicator Dot Overlay
        Positioned(
          bottom: 16.0,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < widget.imagePaths.length; i++) ...[
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: _currentImageIndex == i ? 50.0 : 8.0,
                  height: _currentImageIndex == i ? 8.0 : 8.0,
                  decoration: BoxDecoration(
                    color: _currentImageIndex == i
                        ? AppColors.floraBlack
                        : const Color(0xFFB8999F),
                    borderRadius: BorderRadius.circular(999.0),
                    border: Border.all(color: AppColors.strokeColor),
                  ),
                ),
                if (i != widget.imagePaths.length - 1)
                  const SizedBox(width: 4.0),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
