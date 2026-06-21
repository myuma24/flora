import 'package:flora/core/theme/app_colors.dart';
import 'package:flora/core/theme/app_text_styles.dart';
import 'package:flora/core/widgets/app_icon.dart';
import 'package:flora/core/widgets/quantity.dart';
import 'package:flora/features/home/pages/home_page.dart'; // To access productData and pickedForYouData
import 'package:flora/features/product/widgets/product_image_carousel.dart';
import 'package:flora/features/product/widgets/product_option_pill.dart';
import 'package:flora/features/product/widgets/small_product_card.dart';
import 'package:flutter/material.dart';

class ProductDetailPage extends StatefulWidget {
  final String? productName;

  const ProductDetailPage({super.key, this.productName});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  String _selectedColorOption = "Pink Orange";

  Map<String, String> _getProductDetails() {
    final allProducts = [...productData, ...pickedForYouData];

    // Find the product by name, default to Ranunculus if not found or null
    final name = widget.productName ?? "Ranunculus";
    final baseProduct = allProducts.firstWhere(
      (p) => p['name']?.toLowerCase() == name.toLowerCase(),
      orElse: () => {
        "category": "Focal • Secondary",
        "name": "Ranunculus",
        "originalPrice": "2.97",
        "salePrice": "2.97",
        "imagePath": "assets/images/ranunculus.png",
      },
    );

    // Map description to each flower
    final Map<String, String> descMap = {
      "ranunculus":
          "A short-season favorite. Soft ruffled blooms in coral-blush, opens slowly over 5 days for a romantic centerpiece.",
      "alstroemeria":
          "Long-lasting stems with multiple blooms per head. Perfect for adding volume and texture.",
      "white anemone":
          "Striking white petals with a dark blue-black center. Elegant and modern.",
      "red rose":
          "A classic symbol of love and beauty. Rich velvet petals with a deep fragrance.",
      "white daisy":
          "Simple and cheerful. Crisp white petals surrounding a bright yellow center.",
      "lily of the valley":
          "Delicate bell-shaped white flowers with a sweet, fresh scent.",
      "peony":
          "Lush, fragrant blooms with soft layers of petals. A spring favorite.",
    };

    final key = baseProduct['name']?.toLowerCase() ?? '';
    return {
      ...baseProduct,
      "description":
          descMap[key] ??
          "Beautiful fresh stem, hand-picked for quality and freshness.",
    };
  }

  @override
  Widget build(BuildContext context) {
    final product = _getProductDetails();
    final allProducts = [...productData, ...pickedForYouData];

    // Filter out the current product for the "Explore These" section
    final exploreProducts = allProducts
        .where(
          (p) => p['name']?.toLowerCase() != product['name']?.toLowerCase(),
        )
        .toList();

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 1. Hero Image Carousel
                ProductImageCarousel(
                  imagePaths: [
                    product['imagePath']!,
                    product['imagePath']!,
                    product['imagePath']!,
                  ],
                ),

                // 2. Product Information & Details
                Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Category label
                      Text(
                        product['category']!,
                        style: AppTextStyles.labelMono.copyWith(
                          color: AppColors.primaryPink,
                        ),
                      ),
                      const SizedBox(height: 8.0),

                      // Title and Price
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            product['name']!,
                            style: AppTextStyles.subHeader,
                          ),
                          Text(
                            "\$${product['salePrice']}/stem",
                            style: AppTextStyles.dmSansHeader,
                          ),
                        ],
                      ),
                      const SizedBox(height: 8.0),

                      // Promotion subtext
                      Text(
                        "buy 3 or more and save 10%",
                        style: AppTextStyles.subBodySans.copyWith(
                          color: AppColors.subLabelDarker,
                        ),
                      ),
                      const SizedBox(height: 12.0),

                      // Description
                      Text(
                        product['description']!,
                        style: AppTextStyles.subBodySans,
                      ),
                      const SizedBox(height: 12.0),

                      // Color placeholders
                      Wrap(
                        spacing: 8.0,
                        runSpacing: 8.0,
                        children: [
                          for (var option in [
                            {
                              "label": "Pink Orange",
                              "colors": [Colors.pinkAccent, Colors.orange],
                            },
                            {
                              "label": "White",
                              "colors": [Colors.white],
                            },
                            {
                              "label": "Pink",
                              "colors": [Colors.pinkAccent],
                            },
                            {
                              "label": "Orange",
                              "colors": [Colors.orange],
                            },
                          ]) ...[
                            ProductOptionPill(
                              label: option["label"] as String,
                              colors: option["colors"] as List<Color>,
                              isSelected:
                                  option["label"] == _selectedColorOption,
                              onTap: () {
                                setState(() {
                                  _selectedColorOption =
                                      option["label"] as String;
                                });
                              },
                            ),
                          ],
                        ],
                      ),
                      const SizedBox(
                        height: 16.0,
                      ), // 3. Quantity selector & Add to Cart
                      QuantitySelector(
                        buttonText: "Add to Cart",
                        onButtonPressed: (quantity) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                "Added $quantity x ${product['name']} to Cart",
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16.0),

                // 4. Explore These Section
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Explore These", style: AppTextStyles.dmSansHeader),
                      Text(
                        "More",
                        style: AppTextStyles.subBodySans.copyWith(
                          color: Color(0xFFA7A29B),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 8.0),

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      for (int i = 0; i < exploreProducts.length; i++) ...[
                        SmallProductCard(
                          category: exploreProducts[i]['category']!,
                          name: exploreProducts[i]['name']!,
                          originalPrice: exploreProducts[i]['originalPrice']!,
                          salePrice: exploreProducts[i]['salePrice']!,
                          imagePath: exploreProducts[i]['imagePath']!,
                        ),
                        if (i != exploreProducts.length - 1)
                          const SizedBox(width: 8.0),
                      ],
                    ],
                  ),
                ),
                SafeArea(
                  top: false,
                  bottom: true,
                  child: const SizedBox(height: 16.0),
                ),
              ],
            ),
          ),

          // Top controls overlay (Sticky)
          Positioned(
            top: MediaQuery.of(context).padding.top + 16.0,
            left: 16.0,
            right: 16.0,
            child: Row(
              children: [
                // Back Button
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: const AppIcon(
                    "back_arrow",
                    color: AppColors.floraBlack,
                  ),
                ),
                const Spacer(),
                // Share Button
                const AppIcon("share", color: AppColors.floraBlack),
                const SizedBox(width: 8.0),
                // Favorite Button
                const AppIcon("heart", color: AppColors.floraBlack),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
