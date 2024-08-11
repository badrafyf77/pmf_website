import 'package:flutter/material.dart';
import 'package:pmf_website/features/cups/presentation/views/widgets/cup%20groups%20matches/cup_group_matches_body.dart';
import 'package:pmf_website/responsive/general_scaffold.dart';

class CupGroupsMatchesView extends StatelessWidget {
  const CupGroupsMatchesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const GeneralScaffold(
      isCupsSelected: true,
      desktopBody: CupGroupsMatchesBody(),
      tabletBody: CupGroupsMatchesBody(),
      mobileBody: CupGroupsMatchesBody(),
    );
  }
}


