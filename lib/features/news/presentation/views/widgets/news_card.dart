import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pmf_website/core/utils/customs/image_network.dart';
import 'package:pmf_website/core/utils/helpers/is_mobile_checker.dart';
import 'package:pmf_website/core/utils/styles.dart';
import 'package:pmf_website/features/news/data/models/post_model.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({super.key, required this.post});

  final Post post;

  @override
  Widget build(BuildContext context) {
    bool isMobile = isMobileChecker(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: isMobile ? 10 : MediaQuery.of(context).size.width * .15,
      ),
      child: Center(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: AutoSizeText(
                post.description,
                style: Styles.normal16,
                textAlign: TextAlign.justify,
              ),
            ),
            const SizedBox(height: 3),
            Align(
              alignment: Alignment.centerLeft,
              child: AutoSizeText(
                isToday(post.date.toDate())
                    ? DateFormat('kk:mm').format(post.date.toDate())
                    : DateFormat('yyyy-MM-dd kk:mm').format(post.date.toDate()),
                style: Styles.normal12.copyWith(color: Colors.grey),
                textAlign: TextAlign.justify,
              ),
            ),
            const SizedBox(height: 8),
            CustomImageNetwork(
              url: post.downloadUrl,
              height: isMobile ? 200 : 500,
              width: isMobile
                  ? MediaQuery.of(context).size.width
                  : MediaQuery.of(context).size.width * .5,
            ),
          ],
        ),
      ),
    );
  }

  bool isToday(DateTime date) {
    final DateTime now = DateTime.now();
    return date.year == now.year &&
        date.month == now.month &&
        date.day == now.day;
  }
}
