import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:pmf_website/core/utils/customs/app_footer.dart';
import 'package:pmf_website/core/utils/customs/custom_listview_animation_config.dart';
import 'package:pmf_website/features/leagues/data/models/league_model.dart';
import 'package:pmf_website/features/leagues/presentation/manager/cubit/leagues_cubit.dart';
import 'package:pmf_website/features/leagues/presentation/views/widgets/leagues/desktop/league_card.dart';
import 'package:pmf_website/features/leagues/presentation/views/widgets/leagues/mobile/league_card_mobile.dart';
import 'package:skeletonizer/skeletonizer.dart';

class LeaguesBody extends StatelessWidget {
  const LeaguesBody({super.key, this.isMobile = false, required this.id});

  final bool isMobile;
  final String id;

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> enabled = ValueNotifier<bool>(true);
    League fakeLeague = League(
      id: "id",
      title: "title",
      downloadUrl: "downloadUrl",
      startDate: Timestamp.now(),
      totalPlayers: 20,
      currentRound: 0,
      isHomeAndAway: true,
    );
    return BlocConsumer<LeaguesCubit, LeaguesState>(
      listener: (context, state) {
        if (state is Leagueslaoding) {
          enabled.value = true;
        }
        if (state is GetLeaguesSuccess) {
          enabled.value = false;
        }
      },
      builder: (context, state) {
        if (state is LeaguesFailure) {
          return IconButton(
            onPressed: () {
              BlocProvider.of<LeaguesCubit>(context).getLeagues();
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
              child: ScrollConfiguration(
                behavior:
                    ScrollConfiguration.of(context).copyWith(scrollbars: false),
                child: AnimationLimiter(
                  child: ListView.builder(
                    itemCount: (state is GetLeaguesSuccess)
                        ? state.leaguesList.length
                        : 4,
                    itemBuilder: (context, index) {
                      return CustomListviewAnimationConfig(
                        index: index,
                        child: Column(
                          children: [
                            isMobile
                                ? LeagueCardMobile(id: id,league: (state is GetLeaguesSuccess)
                                        ? state.leaguesList[index]
                                        : fakeLeague,)
                                : LeagueCard(
                                    id: id,
                                    league: (state is GetLeaguesSuccess)
                                        ? state.leaguesList[index]
                                        : fakeLeague,
                                  ),
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
              ),
            );
          },
        );
      },
    );
  }
}
