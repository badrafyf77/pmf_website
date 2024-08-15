import 'package:flutter/material.dart';
import 'package:pmf_website/core/utils/customs/app_footer.dart';
import 'package:pmf_website/core/utils/customs/column_fade_animation.dart';
import 'package:pmf_website/core/utils/customs/list_view.dart';
import 'package:pmf_website/features/home/presentation/views/widgets/trophie_list.dart';

class TrophiesBody extends StatelessWidget {
  const TrophiesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomListView(
      children: [
        ColumnFadeInAnimation(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Trophies(title: "PMF LEAGUES"),
            SizedBox(height: 20),
            Trophies(title: "PMF World Cups"),
            SizedBox(height: 20),
            Trophies(title: "PMF UCL"),
            SizedBox(height: 20),
            Trophies(title: "PMF Super Leagues"),
            SizedBox(height: 30),
            AppFooter(),
          ],
        ),
      ],
    );
  }
}