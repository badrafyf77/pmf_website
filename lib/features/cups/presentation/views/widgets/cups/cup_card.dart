import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pmf_website/core/config/app_router.dart';
import 'package:pmf_website/core/utils/app_colors.dart';
import 'package:pmf_website/core/utils/app_images.dart';
import 'package:pmf_website/core/utils/customs/button.dart';
import 'package:pmf_website/core/utils/customs/pmf_background.dart';
import 'package:pmf_website/core/utils/styles.dart';
import 'package:pmf_website/features/cups/presentation/views/widgets/cups/cup_info.dart';

class CupCard extends StatelessWidget {
  const CupCard({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: PmfBackground(
          height: 310,
          child: Padding(
            padding: const EdgeInsets.all(0),
            child: Center(
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Image.asset(
                          AppAssets.background,
                          width: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const CupInfo(),
                      AutoSizeText(
                        "Start: 01/10/2024",
                        style: Styles.normal16,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  CustomButton(
                    onPressed: () {
                      AppRouter.navigateToWithUrlParametre(
                          context, AppRouter.cupTable, 'id', id);
                    },
                    textButton: "See more",
                    backgroundColor: AppColors.kPrimaryColor,
                    height: 35,
                    width: 120,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
