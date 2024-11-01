import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pmf_website/core/utils/customs/column_fade_animation.dart';
import 'package:pmf_website/core/utils/customs/list_view.dart';
import 'package:pmf_website/core/utils/styles.dart';
import 'package:pmf_website/features/news/presentation/views/widgets/news_card.dart';

class NewsBody extends StatelessWidget {
  const NewsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomListView(
      children: [
        ColumnFadeInAnimation(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * .05,
                ),
                child: AutoSizeText(
                  "NEWS:",
                  style: Styles.normal24.copyWith(fontWeight: FontWeight.bold),
                  maxLines: 1,
                ),
              ),
            ),
            const NewsCard(),
            const SizedBox(height: 20),
          ],
        ),
      ],
    );
  }
}