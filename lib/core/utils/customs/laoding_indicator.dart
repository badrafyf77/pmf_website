import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:pmf_website/core/utils/app_colors.dart';

class LoadingCircle extends StatelessWidget {
  const LoadingCircle({
    super.key,
    this.color = AppColors.kPrimaryColor,
  });
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 80,
        child: LoadingIndicator(
          indicatorType: Indicator.ballScaleRippleMultiple,
          colors: [color],
          strokeWidth: 3,
        ),
      ),
    );
  }
}
