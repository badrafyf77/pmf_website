import 'package:flutter/material.dart';
import 'package:pmf_website/core/utils/customs/views_title.dart';
import 'package:pmf_website/features/trophies/presentation/views/widgets/trophie_card.dart';

class Trophies extends StatelessWidget {
  const Trophies({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ViewsTitle(title: title),
        const TrophiesList(),
      ],
    );
  }
}

class TrophiesList extends StatelessWidget {
  const TrophiesList({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const ScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: getCrossAxisCount(MediaQuery.of(context).size.width),
        mainAxisExtent: 110.0,
        mainAxisSpacing: 20.0,
        crossAxisSpacing: 20.0,
        childAspectRatio: 4.0,
      ),
      itemCount: 5,
      itemBuilder: (context, index) {
        return const TrophieCard();
      },
    );
  }

  int getCrossAxisCount(double width) {
    if (width < 722) {
      return 1;
    } else if (width < 1059) {
      return 2;
    } else {
      return 3;
    }
  }
}
