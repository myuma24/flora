import 'package:flora/core/theme/app_colors.dart';
import 'package:flora/core/theme/app_text_styles.dart';
import 'package:flora/core/widgets/app_icon.dart';
import 'package:flora/features/home/widgets/category_chip.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController(
    text: "Peony",
  );

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Search Bar Header
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(999.0),
                        border: Border.all(
                          color: AppColors.floraBlack,
                          width: 1.0,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10.0,
                        vertical: 8.0,
                      ),
                      child: Row(
                        children: [
                          const AppIcon(
                            "search_new",
                            overrideSize: 20.0,
                            iconOnly: true,
                          ),
                          const SizedBox(width: 8.0),
                          Expanded(
                            child: TextField(
                              controller: _searchController,
                              style: AppTextStyles.subBodySmall,
                              cursorColor: AppColors.primaryPink,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                isDense: true,
                                contentPadding: EdgeInsets.zero,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              _searchController.clear();
                            },
                            child: Container(
                              padding: const EdgeInsets.all(2.0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: AppColors.darkerStrokeColor,
                                  width: 1.0,
                                ),
                              ),
                              child: const Icon(
                                Icons.close,
                                size: 10.0,
                                color: AppColors.darkerStrokeColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  GestureDetector(
                    onTap: () {
                      context.pop();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "cancel",
                        style: AppTextStyles.subBodySans.copyWith(
                          color: AppColors.primaryPink,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),

              // 2. Suggested Search
              Text(
                "Suggested Search",
                style: AppTextStyles.labelMono.copyWith(
                  color: AppColors.subLabelDarker,
                ),
              ),
              const SizedBox(height: 4.0),
              _buildSuggestedSearchItem("peonies", isBold: true),
              _buildSuggestedSearchItem("angels breath"),
              _buildSuggestedSearchItem("ranunculus"),
              _buildSuggestedSearchItem("pink and orange", showBorder: false),

              const SizedBox(height: 32.0),

              // 3. Recent
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recent",
                    style: AppTextStyles.labelMono.copyWith(
                      color: AppColors.subLabelDarker,
                    ),
                  ),
                  Text(
                    "clear",
                    style: AppTextStyles.subBodySans.copyWith(
                      color: AppColors.primaryPink,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: [
                  const CategoryChip(label: "roses"),
                  const CategoryChip(label: "angels breath"),
                  const CategoryChip(label: "peonies"),
                  const CategoryChip(label: "birthday flowers"),
                  const CategoryChip(label: "filler"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSuggestedSearchItem(
    String query, {
    bool isBold = false,
    bool showBorder = true,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      decoration: BoxDecoration(
        border: showBorder
            ? const Border(
                bottom: BorderSide(color: AppColors.strokeColor, width: 1.0),
              )
            : null,
      ),
      child: Row(
        children: [
          const AppIcon(
            "search_new",
            overrideSize: 20.0,
            color: AppColors.subLabelDarker,
          ),
          const SizedBox(width: 8.0),
          RichText(
            text: TextSpan(
              style: AppTextStyles.bodySans,
              children: [
                TextSpan(
                  text: isBold ? query.substring(0, 4) : query,
                  style: isBold
                      ? const TextStyle(fontWeight: FontWeight.bold)
                      : null,
                ),
                if (isBold && query.length > 4)
                  TextSpan(text: query.substring(4)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
