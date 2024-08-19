import 'package:flutter/material.dart';
import 'package:pmf_website/features/leagues/presentation/views/widgets/league%20table/league_table_body.dart';
import 'package:pmf_website/responsive/general_scaffold.dart';

class LeagueTableView extends StatelessWidget {
  const LeagueTableView({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return GeneralScaffold(
      id: id,
      isLeaguesSelected: true,
      desktopBody: LeagueTableBody(id: id),
      tabletBody: LeagueTableBody(id: id),
      mobileBody: LeagueTableBody(id: id),
    );
  }
}
