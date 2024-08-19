import 'package:flutter/material.dart';
import 'package:pmf_website/core/utils/customs/app_footer.dart';
import 'package:pmf_website/core/utils/customs/column_fade_animation.dart';
import 'package:pmf_website/core/utils/customs/list_view.dart';
import 'package:pmf_website/features/cups/presentation/views/widgets/cup%20knockout/matches.dart';
import 'package:pmf_website/features/cups/presentation/views/widgets/cups_bar.dart';

class CupKnockoutBody extends StatelessWidget {
  const CupKnockoutBody({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return CustomListView(
      children: [
        ColumnFadeInAnimation(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CupBar(
              id: id,
              isKnockoutSelected: true,
            ),
            const CupKnockoutMatches(),
            const SizedBox(height: 30),
            const AppFooter(),
          ],
        ),
      ],
    );
  }
}
