import 'package:flutter/material.dart';
import 'package:pmf_website/core/utils/app_colors.dart';
import 'package:pmf_website/core/utils/app_images.dart';

class PmfBackground extends StatelessWidget {
  const PmfBackground({
    super.key,
    this.child,
    this.height = 250,
    this.width,
    this.backgroundColor = Colors.white,
  });

  final Widget? child;
  final double? height;
  final double? width;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Stack(
        children: [
          Opacity(
            opacity: .4,
            child: Container(
              height: height,
              width: width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    backgroundColor,
                    AppColors.kPrimaryColor,
                    backgroundColor,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  tileMode: TileMode.mirror,
                ),
                image: const DecorationImage(
                  image: AssetImage(
                    AppAssets.logo,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: height,
            width: width,
            child: child,
          ),
        ],
      ),
    );
  }
}
