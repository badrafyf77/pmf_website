import 'package:flutter/material.dart';
import 'package:pmf_website/core/utils/customs/app_footer.dart';
import 'package:pmf_website/core/utils/customs/column_fade_animation.dart';
import 'package:pmf_website/core/utils/customs/list_view.dart';
import 'package:pmf_website/features/profile/presentation/views/desktop/widgets/first_body_part.dart';
import 'package:pmf_website/features/profile/presentation/views/desktop/widgets/profile_stats.dart';
import 'package:pmf_website/features/profile/presentation/views/desktop/widgets/win_rate_pie.dart';

class MobileProfileBody extends StatelessWidget {
  const MobileProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomListView(
      children: [
        ColumnFadeInAnimation(
          children: [
            FirstPart(
              isMobile: true,
            ),
            SizedBox(height: 20),
            Center(
              child: Column(
                children: [
                  ProfileStats(
                    isMobile: true,
                  ),
                  SizedBox(height: 20),
                  WinRatePie(),
                ],
              ),
            ),
            SizedBox(height: 30),
            AppFooter(),
          ],
        ),
      ],
    );
  }
}
