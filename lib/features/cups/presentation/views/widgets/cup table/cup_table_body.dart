import 'package:flutter/material.dart';
import 'package:pmf_website/core/utils/customs/app_footer.dart';
import 'package:pmf_website/core/utils/customs/column_fade_animation.dart';
import 'package:pmf_website/core/utils/customs/list_view.dart';
import 'package:pmf_website/features/cups/presentation/views/widgets/cup%20table/groups_list.dart';
import 'package:pmf_website/features/cups/presentation/views/widgets/cups_bar.dart';

class CupTableBody extends StatelessWidget {
  const CupTableBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomListView(
      children: [
        ColumnFadeInAnimation(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CupBar(
              isTableSelected: true,
            ),
            GroupsList(),
            SizedBox(height: 20),
            AppFooter(),
          ],
        ),
      ],
    );
  }
}