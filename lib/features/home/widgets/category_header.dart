import 'package:flora/core/theme/app_text_styles.dart';
import 'package:flora/core/widgets/app_icon.dart';
import 'package:flutter/material.dart';

class CategoryHeader extends StatefulWidget {
  final String title;

  const CategoryHeader({super.key, required this.title});

  @override
  State<CategoryHeader> createState() => _CategoryHeaderState();
}

class _CategoryHeaderState extends State<CategoryHeader> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Text(widget.title, style: AppTextStyles.dmSansHeader),
          ),
          const SizedBox(width: 10.0),
          AppIcon("forward_arrow", overrideSize: 32.0),
        ],
      ),
    );
  }
}
