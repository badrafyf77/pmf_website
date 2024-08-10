import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pmf_website/core/utils/app_images.dart';
import 'package:pmf_website/core/utils/customs/pmf_background.dart';
import 'package:pmf_website/core/utils/styles.dart';

class FirstPart extends StatelessWidget {
  const FirstPart({
    super.key,
    this.isMobile = false,
  });

  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const PmfBackground(),
        const SizedBox(
          height: 325,
        ),
        Positioned(
          left: 25,
          bottom: 0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ProfileImage(
                isMobile: isMobile,
              ),
              const SizedBox(
                width: 10,
              ),
              ProfileInfo(
                isMobile: isMobile,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({
    super.key,
    required this.isMobile,
  });

  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            "AFYF BADREDDINE",
            style: Styles.normal30.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: isMobile ? 20 : 30,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          AutoSizeText(
            "Joined At: 19/08/2024 06:18",
            style: Styles.normal14.copyWith(
              color: Colors.grey,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

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
