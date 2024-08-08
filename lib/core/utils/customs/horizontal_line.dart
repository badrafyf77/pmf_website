import 'package:flutter/material.dart';
import 'package:pmf_website/core/utils/app_colors.dart';

class HorizontalLine extends StatelessWidget implements PreferredSizeWidget {
  const HorizontalLine({
    super.key,
    this.color = AppColors.kPrimaryColor,
    this.height = 1.5,
  });

  final Color color;
  final double height;

  @override
  Size get preferredSize => const Size.fromHeight(0.0);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(0.0),
      child: Container(
        color: color,
        height: height,
      ),
    );
  }
}
