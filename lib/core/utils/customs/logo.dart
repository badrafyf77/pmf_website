import 'package:flutter/material.dart';
import 'package:mouse_follower/mouse_follower.dart';
import 'package:pmf_website/core/utils/app_images.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key,
    this.height = 100,
    this.width = 120,
    this.blackLogo = false,
  });

  final double height;
  final double width;
  final bool blackLogo;

  @override
  Widget build(BuildContext context) {
    return MouseOnHoverEvent(
      child: Image.asset(
        (!blackLogo) ? AppAssets.logo : AppAssets.logo,
        height: height,
        width: width,
      ),
    );
  }
}
