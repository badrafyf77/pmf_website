import 'package:flutter/material.dart';
import 'package:pmf_website/core/models/fixture_model.dart';
import 'package:pmf_website/core/utils/customs/custom_gridview_animation_config.dart';
import 'package:pmf_website/features/leagues/presentation/views/widgets/league%20matches/match_card.dart';

class CupGroupMatches extends StatelessWidget {
  const CupGroupMatches({super.key});

  @override
  Widget build(BuildContext context) {
    Fixture fakeFixture = Fixture(
      id: "id",
      round: 1,
      homeId: "",
      homeName: "homeName",
      homeGoals: 3,
      awayId: "awayId",
      awayName: "awayName",
      awayGoals: 2,
      isPlayed: false,
    );
    return Column(
      children: [
        const SizedBox(height: 10),
        GridView.builder(
          physics: const ScrollPhysics(),
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount:
                getCrossAxisCount(MediaQuery.of(context).size.width),
            mainAxisExtent: 80.0,
            mainAxisSpacing: 20.0,
            crossAxisSpacing: 20.0,
            childAspectRatio: 4.0,
          ),
          itemCount: 10,
          itemBuilder: (context, index) {
            return CustomGridviewAnimationConfig(
              index: index,
              columnCount: 10,
              child: MatchCard(
                fixture: fakeFixture,
              ),
            );
          },
        ),
      ],
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
