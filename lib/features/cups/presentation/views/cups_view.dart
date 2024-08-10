import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:pmf_website/core/utils/app_colors.dart';
import 'package:pmf_website/core/utils/app_images.dart';
import 'package:pmf_website/core/utils/customs/app_footer.dart';
import 'package:pmf_website/core/utils/customs/button.dart';
import 'package:pmf_website/core/utils/customs/custom_listview_animation_config.dart';
import 'package:pmf_website/core/utils/customs/pmf_background.dart';
import 'package:pmf_website/core/utils/styles.dart';
import 'package:pmf_website/responsive/general_scaffold.dart';

class CupsView extends StatelessWidget {
  const CupsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const GeneralScaffold(
      isCupsSelected: true,
      desktopBody: CupsBody(),
      tabletBody: CupsBody(),
      mobileBody: CupsBody(),
    );
  }
}

class CupsBody extends StatelessWidget {
  const CupsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      child: AnimationLimiter(
        child: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) {
            return CustomListviewAnimationConfig(
              index: index,
              child: Column(
                children: [
                  const CupCard(),
                  if (index == 3)
                    const Column(
                      children: [
                        SizedBox(height: 30),
                        AppFooter(),
                      ],
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class CupCard extends StatelessWidget {
  const CupCard({super.key});

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
                    onPressed: () {},
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

class CupInfo extends StatelessWidget {
  const CupInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          "World Cup",
          style: Styles.normal30.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        AutoSizeText(
          "32 players",
          style: Styles.normal16.copyWith(
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
