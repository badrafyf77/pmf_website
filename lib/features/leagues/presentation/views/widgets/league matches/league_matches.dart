import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pmf_website/core/models/fixture_model.dart';
import 'package:pmf_website/core/services/firestore_service.dart';
import 'package:pmf_website/core/utils/customs/custom_gridview_animation_config.dart';
import 'package:pmf_website/features/leagues/data/models/league_model.dart';
import 'package:pmf_website/features/leagues/presentation/manager/cubit/leagues_cubit.dart';
import 'package:pmf_website/features/leagues/presentation/views/widgets/league%20matches/match_card.dart';
import 'package:pmf_website/features/leagues/presentation/views/widgets/league%20matches/weeks_row.dart';
import 'package:skeletonizer/skeletonizer.dart';

class LeagueMatches extends StatelessWidget {
  const LeagueMatches({super.key, required this.leagueId});

  final String leagueId;

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> enabled = ValueNotifier<bool>(true);
    final ValueNotifier<League> league = ValueNotifier<League>(League(
        id: "fake",
        title: "title",
        downloadUrl: "downloadUrl",
        startDate: Timestamp.now(),
        totalPlayers: 20,
        currentRound: 1,
        isHomeAndAway: true));
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
        ValueListenableBuilder<League>(
            valueListenable: league,
            builder: (context, value, child) {
              return value.id == "fake"
                  ? const SizedBox()
                  : WeeksRow(
                      league: value,
                    );
            }),
        const SizedBox(height: 10),
        BlocConsumer<LeaguesCubit, LeaguesState>(
          listener: (context, state) async {
            if (state is Leagueslaoding) {
              enabled.value = true;
              league.value = await FirestoreService().getLeague(leagueId);
            }
            if (state is GetMatchesSuccess) {
              enabled.value = false;
              league.value = await FirestoreService().getLeague(leagueId);
            }
          },
          builder: (context, state) {
            if (state is LeaguesFailure) {
              return IconButton(
                onPressed: () {
                  BlocProvider.of<LeaguesCubit>(context).getMatches(leagueId);
                },
                icon: const Icon(
                  Icons.refresh,
                  color: Colors.white,
                ),
              );
            }
            return ValueListenableBuilder<bool>(
                valueListenable: enabled,
                builder: (context, value, child) {
                  return Skeletonizer(
                    enabled: value,
                    child: GridView.builder(
                      physics: const ScrollPhysics(),
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: getCrossAxisCount(
                            MediaQuery.of(context).size.width),
                        mainAxisExtent: 80.0,
                        mainAxisSpacing: 20.0,
                        crossAxisSpacing: 20.0,
                        childAspectRatio: 4.0,
                      ),
                      itemCount: (state is GetMatchesSuccess)
                          ? state.fixtures.length
                          : 10,
                      itemBuilder: (context, index) {
                        return CustomGridviewAnimationConfig(
                          index: index,
                          columnCount: (state is GetMatchesSuccess)
                              ? state.fixtures.length
                              : 10,
                          child: MatchCard(
                            fixture: (state is GetMatchesSuccess)
                                ? state.fixtures[index]
                                : fakeFixture,
                          ),
                        );
                      },
                    ),
                  );
                });
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
