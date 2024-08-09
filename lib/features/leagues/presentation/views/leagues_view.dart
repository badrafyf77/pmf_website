import 'package:flutter/material.dart';
import 'package:pmf_website/responsive/general_scaffold.dart';

class LeaguesView extends StatelessWidget {
  const LeaguesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const GeneralScaffold(
      isLeaguesSelected: true,
      desktopBody: LeaguesBody(),
      tabletBody: LeaguesBody(),
      mobileBody: LeaguesBody(),
    );
  }
}

class LeaguesBody extends StatelessWidget {
  const LeaguesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}