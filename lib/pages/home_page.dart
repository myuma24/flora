import 'package:flora/constants/app_colors.dart';
import 'package:flora/widgets/home/catalog_card.dart';
import 'package:flora/widgets/home/category_header.dart';
import 'package:flora/widgets/home/marketing_card.dart';
import 'package:flora/widgets/home/product_card.dart';
import 'package:flora/widgets/home/search_bar.dart';
import 'package:flora/widgets/home/category_chip.dart';
import 'package:flutter/material.dart';

// 1. Here is your Top-Level Global Constant Array!
const List<Map<String, String>> categoryData = [
  {"label": "All"},
  {
    "icon": "home",
    "label": "Indoor",
  }, // using icons you already have as examples!
  {"label": "Outdoor"},
  {"icon": "cart", "label": "Accessories"},
  {"label": "Pots"},
];

const List<Map<String, String>> catalogData = [
  {"title": "Premade"},
  {"title": "Focal"},
  {"title": "Filler"},
  {"title": "Line"},
];

const List<Map<String, String>> productData = [
  {
    "category": "Focal Flower",
    "name": "Red Rose",
    "originalPrice": "2.97",
    "salePrice": "1.97",
  },
  {
    "category": "Focal Flower",
    "name": "White Daisy",
    "originalPrice": "1.97",
    "salePrice": "1.97",
  },
  {
    "category": "Filler",
    "name": "Lily of the Valley",
    "originalPrice": "2.99",
    "salePrice": "2.99",
  },
];

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pageBackground,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: HomeSearchBar(),
                ),

                // Categories
                const SizedBox(height: 16),

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      for (int i = 0; i < categoryData.length; i++) ...[
                        CategoryChip(
                          icon: categoryData[i]['icon'],
                          label: categoryData[i]['label'],
                        ),
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
                  child: CategoryHeader(title: "Catalog"),
                ),

                const SizedBox(height: 8.0),

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      for (int i = 0; i < catalogData.length; i++) ...[
                        CatalogCard(title: catalogData[i]['title']!),

                        if (i != catalogData.length - 1)
                          const SizedBox(width: 24.0),
                      ],
                    ],
                  ),
                ),

                const SizedBox(height: 16.0),

                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: CategoryHeader(title: "Popular"),
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
                        ),
                        if (i != productData.length - 1)
                          const SizedBox(width: 12.0),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
