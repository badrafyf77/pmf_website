import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pmf_website/core/models/player_model.dart';
import 'package:pmf_website/core/utils/customs/app_footer.dart';
import 'package:pmf_website/core/utils/customs/column_fade_animation.dart';
import 'package:pmf_website/core/utils/customs/list_view.dart';
import 'package:pmf_website/features/leagues/presentation/manager/cubit/leagues_cubit.dart';
import 'package:pmf_website/features/leagues/presentation/views/widgets/league_bar.dart';
import 'package:pmf_website/features/leagues/presentation/views/widgets/league%20table/table.dart';
import 'package:skeletonizer/skeletonizer.dart';

class LeagueTableBody extends StatelessWidget {
  const LeagueTableBody({
    super.key,
    required this.leagueId,
  });

  final String leagueId;

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> enabled = ValueNotifier<bool>(true);
    return CustomListView(
      children: [
        ColumnFadeInAnimation(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LeagueBar(
              leagueId: leagueId,
              isTableSelected: true,
            ),
            BlocConsumer<LeaguesCubit, LeaguesState>(
              listener: (context, state) {
                if (state is Leagueslaoding) {
                  enabled.value = true;
                }
                if (state is GetPlayersSuccess) {
                  enabled.value = false;
                }
              },
              builder: (context, state) {
                if (state is LeaguesFailure) {
                  return IconButton(
                    onPressed: () {
                      BlocProvider.of<LeaguesCubit>(context)
                          .getPlayers(leagueId);
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
                      child: StandingTable(
                        playersList: List.from(
                          (state is GetPlayersSuccess)
                              ? state.playersList
                              : leaguePlayers,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
            const SizedBox(height: 30),
            const AppFooter(),
          ],
        ),
      ],
    );
  }
}
