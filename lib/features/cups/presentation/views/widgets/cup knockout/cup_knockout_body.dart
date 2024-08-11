import 'package:flutter/material.dart';
import 'package:pmf_website/core/utils/customs/app_footer.dart';
import 'package:pmf_website/core/utils/customs/column_fade_animation.dart';
import 'package:pmf_website/core/utils/customs/list_view.dart';
import 'package:pmf_website/features/cups/presentation/views/widgets/cup%20knockout/matches.dart';
import 'package:pmf_website/features/cups/presentation/views/widgets/cups_bar.dart';

class CupKnockoutBody extends StatelessWidget {
  const CupKnockoutBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomListView(
      children: [
        ColumnFadeInAnimation(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CupBar(
              isKnockoutSelected: true,
            ),
            CupKnockoutMatches(),
            SizedBox(height: 30),
            AppFooter(),
          ],
        ),
      ],
    );
  }
}