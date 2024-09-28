import 'package:flutter/material.dart';
import 'package:pmf_website/core/utils/app_colors.dart';
import 'package:pmf_website/core/utils/app_images.dart';

class BlackContainerWithStars extends StatelessWidget {
  const BlackContainerWithStars({
    super.key,
    required this.height,
    required this.width,
    this.topLeftRadius = 40,
    this.topRightRadius = 40,
    this.bottomLeftRadius = 0,
    this.bottomRightRadius = 40,
    required this.child,
  });

  final double height;
  final double width;
  final double topLeftRadius;
  final double topRightRadius;
  final double bottomLeftRadius;
  final double bottomRightRadius;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: AppColors.kPrimaryColor,
        image: const DecorationImage(
          image: AssetImage(
            AppAssets.logo,
          ),
          fit: BoxFit.cover,
          opacity: .6,
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(topLeftRadius),
          bottomRight: Radius.circular(bottomRightRadius),
          topRight: Radius.circular(topRightRadius),
          bottomLeft: Radius.circular(bottomLeftRadius),
        ),
      ),
      child: child,
    );
  }
}
