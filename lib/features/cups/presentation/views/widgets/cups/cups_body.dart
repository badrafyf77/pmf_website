import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:pmf_website/core/utils/customs/app_footer.dart';
import 'package:pmf_website/core/utils/customs/custom_listview_animation_config.dart';
import 'package:pmf_website/features/cups/presentation/views/widgets/cups/cup_card.dart';

class CupsBody extends StatelessWidget {
  const CupsBody({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      child: AnimationLimiter(
        child: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) {
            return CustomListviewAnimationConfig(
              index: index,
              child: Column(
                children: [
                  CupCard(id: id),
                  if (index == 3)
                    const Column(
                      children: [
                        SizedBox(height: 30),
                        AppFooter(),
                      ],
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
