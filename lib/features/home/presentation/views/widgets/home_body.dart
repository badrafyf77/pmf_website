import 'package:flutter/material.dart';
import 'package:pmf_website/core/utils/app_colors.dart';
import 'package:pmf_website/core/utils/customs/app_footer.dart';
import 'package:pmf_website/core/utils/customs/column_fade_animation.dart';
import 'package:pmf_website/core/utils/customs/list_view.dart';
import 'package:pmf_website/features/home/presentation/views/widgets/home_logo_and_text.dart';
import 'package:pmf_website/features/home/presentation/views/widgets/pmf_achievements.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomListView(
      children: [
        ColumnFadeInAnimation(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HomeLogoAndText(),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: MediaQuery.of(context).size.width * .05,
              ),
              child: Container(
                height: 1,
                color: AppColors.kPrimaryColor,
              ),
            ),
            const PMFClanTrophies(),
            const SizedBox(height: 30),
            const AppFooter(),
          ],
        ),
      ],
    );
  }
}