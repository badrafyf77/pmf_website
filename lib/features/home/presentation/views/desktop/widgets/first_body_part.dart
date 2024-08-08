// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:pmf_website/core/utils/app_colors.dart';
import 'package:pmf_website/core/utils/app_images.dart';
import 'package:pmf_website/core/utils/customs/button.dart';
import 'package:pmf_website/features/home/presentation/views/widgets/events_week_description.dart';

class FirstPart extends StatelessWidget {
  const FirstPart({
    super.key,
    this.widthPercent = .35,
  });

  final double widthPercent;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          AppAssets.logo,
          height: 200,
          width: 300,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const EventsWeekDescription(),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
              onPressed: () {},
              textButton: "VOIR PLUS",
              backgroundColor: AppColors.kPrimaryColor,
              height: 40,
              width: 160,
            ),
          ],
        ),
      ],
    );
  }
}
