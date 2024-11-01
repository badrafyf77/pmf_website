import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pmf_website/core/utils/customs/views_title.dart';
import 'package:pmf_website/core/utils/helpers/show_toast.dart';
import 'package:pmf_website/features/leagues/presentation/manager/cubit/leagues_cubit.dart';
import 'package:pmf_website/features/leagues/presentation/views/widgets/league_bar_items.dart';
import 'package:skeletonizer/skeletonizer.dart';

class LeagueBar extends StatefulWidget {
  const LeagueBar({
    super.key,
    this.isTableSelected = false,
    this.isMatchesSelected = false,
    required this.leagueId,
  });

  final String leagueId;
  final bool isTableSelected;
  final bool isMatchesSelected;

  @override
  State<LeagueBar> createState() => _LeagueBarState();
}

class _LeagueBarState extends State<LeagueBar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> enabled = ValueNotifier<bool>(false);
    final ValueNotifier<String> title = ValueNotifier<String>("SERIE");
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BlocConsumer<LeaguesCubit, LeaguesState>(
          listener: (context, state) {
            if (state is Leagueslaoding) {
              enabled.value = true;
            }
            if (state is LeaguesFailure) {
              enabled.value = true;
              BlocProvider.of<LeaguesCubit>(context).getLeague(widget.leagueId);
              myShowToastError(context, state.err);
            }
            if (state is GetLeagueSuccess) {
              enabled.value = false;
              title.value = state.league.title;
            }
          },
          builder: (context, state) {
            return ValueListenableBuilder<bool>(
              valueListenable: enabled,
              builder: (context, value, child) {
                return Skeletonizer(
                  enabled: value,
                  child: ValueListenableBuilder<String>(
                      valueListenable: title,
                      builder: (context, value, child) {
                        return ViewsTitle(
                          title: "PMF $value",
                        );
                      }),
                );
              },
            );
          },
        ),
        const SizedBox(height: 15),
        LeagueBarItems(
          leagueId: widget.leagueId,
          isTableSelected: widget.isTableSelected,
          isMatchesSelected: widget.isMatchesSelected,
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
