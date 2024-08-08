import 'package:flutter/material.dart';
import 'package:pmf_website/core/utils/app_colors.dart';
import 'package:pmf_website/core/utils/app_images.dart';
import 'package:pmf_website/core/utils/customs/button.dart';

class FirstPartMobile extends StatelessWidget {
  const FirstPartMobile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          AppAssets.logo,
          height: 150,
          width: 220,
        ),
        
        const SizedBox(
          height: 15,
        ),
        CustomButton(
          onPressed: () {},
          textButton: "VOIR PLUS",
          backgroundColor: AppColors.kPrimaryColor,
          height: 30,
          width: 130,
          fontSize: 12,
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
