import 'package:flutter/material.dart';
import 'package:pmf_website/features/leagues/presentation/views/widgets/league%20matches/league_matches_body.dart';
import 'package:pmf_website/responsive/general_scaffold.dart';

class LeagueMatchesView extends StatelessWidget {
  const LeagueMatchesView({super.key, required this.id, required this.leagueId});

  final String id;
  final String leagueId;

  @override
  Widget build(BuildContext context) {
    return GeneralScaffold(
      id: id,
      isLeaguesSelected: true,
      desktopBody: LeagueMatchesBody(id: id,leagueId: leagueId),
      tabletBody: LeagueMatchesBody(id: id,leagueId: leagueId),
      mobileBody: LeagueMatchesBody(id: id,leagueId: leagueId),
    );
  }
}
