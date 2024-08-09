import 'package:flutter/material.dart';
import 'package:pmf_website/responsive/general_scaffold.dart';

class LeagueInfoView extends StatelessWidget {
  const LeagueInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return const GeneralScaffold(
      isLeaguesSelected: true,
      desktopBody: LeagueInfoBody(),
      tabletBody: LeagueInfoBody(),
      mobileBody: LeagueInfoBody(),
    );
  }
}

class LeagueInfoBody extends StatelessWidget {
  const LeagueInfoBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
