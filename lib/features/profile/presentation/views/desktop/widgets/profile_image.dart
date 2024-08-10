import 'package:flutter/material.dart';
import 'package:pmf_website/core/utils/app_images.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key, required this.isMobile});

  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isMobile ? 100 : 150,
      width: isMobile ? 100 : 150,
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage(
            AppAssets.logo,
          ),
        ),
        shape: BoxShape.circle,
      ),
    );
  }
}