import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:pmf_website/core/utils/customs/app_footer.dart';
import 'package:pmf_website/core/utils/customs/custom_listview_animation_config.dart';
import 'package:pmf_website/features/leagues/presentation/views/widgets/leagues/desktop/league_card.dart';
import 'package:pmf_website/features/leagues/presentation/views/widgets/leagues/mobile/league_card_mobile.dart';

class LeaguesBody extends StatelessWidget {
  const LeaguesBody({super.key, this.isMobile = false});

  final bool isMobile;

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
                  isMobile ? const LeagueCardMobile() : const LeagueCard(),
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