import 'package:flutter/material.dart';
import 'package:pmf_website/features/leagues/presentation/views/widgets/league%20table/league_table_body.dart';
import 'package:pmf_website/responsive/general_scaffold.dart';

class LeagueTableView extends StatelessWidget {
  const LeagueTableView({super.key});

  @override
  Widget build(BuildContext context) {
    return const GeneralScaffold(
      isLeaguesSelected: true,
      desktopBody: LeagueTableBody(),
      tabletBody: LeagueTableBody(),
      mobileBody: LeagueTableBody(),
    );
  }
}
