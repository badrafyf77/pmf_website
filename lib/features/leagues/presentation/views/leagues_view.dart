import 'package:flutter/material.dart';
import 'package:pmf_website/features/leagues/presentation/views/widgets/leagues/leagues_body.dart';
import 'package:pmf_website/responsive/general_scaffold.dart';

class LeaguesView extends StatelessWidget {
  const LeaguesView({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return GeneralScaffold(
      id: id,
      isLeaguesSelected: true,
      desktopBody: LeaguesBody(id: id),
      tabletBody: LeaguesBody(id: id),
      mobileBody: LeaguesBody(
        id: id,
        isMobile: true,
      ),
    );
  }
}
