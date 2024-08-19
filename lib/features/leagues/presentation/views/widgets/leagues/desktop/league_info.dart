import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pmf_website/core/config/app_router.dart';
import 'package:pmf_website/core/utils/app_colors.dart';
import 'package:pmf_website/core/utils/customs/button.dart';
import 'package:pmf_website/core/utils/styles.dart';

class LeagueInfo extends StatelessWidget {
  const LeagueInfo({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          "SERIE 1",
          style: Styles.normal30.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        AutoSizeText(
          "20 players",
          style: Styles.normal16.copyWith(
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 50),
        Row(
          children: [
            AutoSizeText(
              "Start:",
              style: Styles.normal16,
            ),
            const SizedBox(width: 6),
            AutoSizeText(
              "01/09/2024",
              style: Styles.normal16.copyWith(
                color: Colors.grey,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        CustomButton(
          onPressed: () {
            AppRouter.navigateToWithUrlParametre(
                  context, AppRouter.leagueTable, 'id', id);
          },
          textButton: "See more",
          backgroundColor: AppColors.kPrimaryColor,
          height: 35,
          width: 120,
        )
      ],
    );
  }
}
