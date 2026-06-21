import 'package:flora/core/theme/app_colors.dart';
import 'package:flora/features/home/widgets/category_chip.dart';
import 'package:flora/features/home/widgets/category_header.dart';
import 'package:flora/features/home/widgets/home_header.dart';
import 'package:flora/features/home/widgets/marketing_card.dart';
import 'package:flora/features/home/widgets/product_card.dart';
import 'package:flutter/material.dart';

// 1. Here is your Top-Level Global Constant Array!
const List<Map<String, String>> categoryData = [
  {"label": "All • 68"},
  {"label": "Focal • 47"},
  {"label": "Secondary • 36"},
  {"label": "Line • 82"},
];

const List<Map<String, String>> catalogData = [
  {"title": "Premade", "imagePath": "assets/images/peony.png"},
  {"title": "Focal", "imagePath": "assets/images/alstroemeria.png"},
  {"title": "Filler", "imagePath": "assets/images/ranunculus.png"},
  {"title": "Line", "imagePath": "assets/images/white-anenome.png"},
];

const List<Map<String, String>> productData = [
  {
    "category": "Focal • Filler",
    "name": "Red Rose",
    "originalPrice": "2.97",
    "salePrice": "1.97",
    "imagePath": "assets/images/peony.png",
  },
  {
    "category": "Focal • Filler",
    "name": "White Daisy",
    "originalPrice": "1.97",
    "salePrice": "1.97",
    "imagePath": "assets/images/alstroemeria.png",
  },
  {
    "category": "Focal • Filler",
    "name": "Lily of the Valley",
    "originalPrice": "2.99",
    "salePrice": "2.99",
    "imagePath": "assets/images/ranunculus.png",
  },
  {
    "category": "Focal • Filler",
    "name": "White Anemone",
    "originalPrice": "3.50",
    "salePrice": "3.00",
    "imagePath": "assets/images/white-anenome.png",
  },
];

const List<Map<String, String>> pickedForYouData = [
  {
    "category": "Focal • Filler",
    "name": "Alstroemeria",
    "originalPrice": "2.97",
    "salePrice": "2.97",
    "imagePath": "assets/images/alstroemeria.png",
  },
  {
    "category": "Focal • Filler",
    "name": "White Anemone",
    "originalPrice": "2.97",
    "salePrice": "2.97",
    "imagePath": "assets/images/white-anenome.png",
  },
  {
    "category": "Focal • Filler",
    "name": "Peony",
    "originalPrice": "3.99",
    "salePrice": "3.99",
    "imagePath": "assets/images/peony.png",
  },
  {
    "category": "Focal • Filler",
    "name": "Ranunculus",
    "originalPrice": "2.50",
    "salePrice": "2.50",
    "imagePath": "assets/images/ranunculus.png",
  },
];

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: HomeHeader(),
              ),

              // Categories
              const SizedBox(height: 16),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    for (int i = 0; i < categoryData.length; i++) ...[
                      CategoryChip(label: categoryData[i]['label']),
                      if (i != categoryData.length - 1)
                        const SizedBox(width: 8.0),
                    ],
                  ],
                ),
              ),

              const SizedBox(height: 16.0),

              // Marketing Card
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: MarketingCard(),
              ),

              const SizedBox(height: 12.0),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: CategoryHeader(title: "In Season"),
              ),

              const SizedBox(height: 8.0),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    for (int i = 0; i < productData.length; i++) ...[
                      ProductCard(
                        category: productData[i]['category']!,
                        name: productData[i]['name']!,
                        originalPrice: productData[i]['originalPrice']!,
                        salePrice: productData[i]['salePrice']!,
                        imagePath: productData[i]['imagePath']!,
                      ),
                      if (i != productData.length - 1)
                        const SizedBox(width: 12.0),
                    ],
                  ],
                ),
              ),

              const SizedBox(height: 16.0),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: CategoryHeader(title: "Picked For You"),
              ),

              const SizedBox(height: 8.0),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    for (int i = 0; i < pickedForYouData.length; i++) ...[
                      ProductCard(
                        category: pickedForYouData[i]['category']!,
                        name: pickedForYouData[i]['name']!,
                        originalPrice: pickedForYouData[i]['originalPrice']!,
                        salePrice: pickedForYouData[i]['salePrice']!,
                        imagePath: pickedForYouData[i]['imagePath']!,
                      ),
                      if (i != pickedForYouData.length - 1)
                        const SizedBox(width: 12.0),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
