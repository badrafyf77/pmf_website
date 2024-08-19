import 'package:flutter/material.dart';
import 'package:pmf_website/core/utils/customs/app_footer.dart';
import 'package:pmf_website/core/utils/customs/column_fade_animation.dart';
import 'package:pmf_website/core/utils/customs/list_view.dart';
import 'package:pmf_website/features/cups/presentation/views/widgets/cup%20groups%20matches/matches.dart';
import 'package:pmf_website/features/cups/presentation/views/widgets/cups_bar.dart';

class CupGroupsMatchesBody extends StatelessWidget {
  const CupGroupsMatchesBody({super.key, required this.id});

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
              isGroupsMatchesSelected: true,
            ),
            const CupGroupMatches(),
            const SizedBox(height: 30),
            const AppFooter(),
          ],
        ),
      ],
    );
  }
}
