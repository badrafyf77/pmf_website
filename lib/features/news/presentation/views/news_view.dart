import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pmf_website/features/news/presentation/views/widgets/news_body.dart';
import 'package:pmf_website/responsive/general_scaffold.dart';

class NewsView extends StatelessWidget {
  const NewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const GeneralScaffold(
      isNewsSelected: true,
      desktopBody: NewsBody(),
      tabletBody: NewsBody(),
      mobileBody: NewsBody(),
    );
  }
}
