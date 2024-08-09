import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pmf_website/core/utils/app_colors.dart';
import 'package:pmf_website/core/utils/app_images.dart';
import 'package:pmf_website/core/utils/styles.dart';

class FirstPart extends StatelessWidget {
  const FirstPart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Opacity(
          opacity: .4,
          child: Container(
            height: 250,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.transparent,
                  AppColors.kPrimaryColor,
                  Colors.transparent,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                tileMode: TileMode.mirror,
              ),
              image: DecorationImage(
                image: AssetImage(
                  AppAssets.logo,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 325,
        ),
        const Positioned(
          left: 25,
          bottom: 0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ProfileImage(),
              SizedBox(
                width: 10,
              ),
              ProfileInfo(),
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
  });

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
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
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
