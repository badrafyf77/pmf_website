import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pmf_website/core/utils/styles.dart';
import 'package:pmf_website/features/leagues/data/models/league_model.dart';
import 'package:pmf_website/features/leagues/presentation/manager/cubit/leagues_cubit.dart';

class WeeksRow extends StatefulWidget {
  const WeeksRow({
    super.key,
    required this.league,
  });

  final League league;

  @override
  State<WeeksRow> createState() => _WeeksRowState();
}

class _WeeksRowState extends State<WeeksRow> {
  late int round;

  @override
  void initState() {
    round = widget.league.currentRound;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {
            if (round > 1) {
              setState(() {
                round--;
              });
              BlocProvider.of<LeaguesCubit>(context)
                  .getMatches(widget.league.id, round: round);
            }
          },
          icon: const Icon(
            Icons.chevron_left,
            color: Colors.grey,
          ),
          highlightColor: Colors.white,
        ),
        const SizedBox(width: 50),
        Text(
          "Week $round",
          style: Styles.normal20.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
        const SizedBox(width: 50),
        IconButton(
          onPressed: () {
            int maxRounds =
                (widget.league.totalPlayers - 1) * (widget.league.isHomeAndAway ? 2 : 1);
            if (round < maxRounds) {
              setState(() {
                round++;
              });
              BlocProvider.of<LeaguesCubit>(context)
                  .getMatches(widget.league.id, round: round);
            }
          },
          icon: const Icon(
            Icons.chevron_right,
            color: Colors.grey,
          ),
          highlightColor: Colors.white,
        ),
      ],
    );
  }
}
