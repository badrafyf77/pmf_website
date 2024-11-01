import 'package:flutter/material.dart';
import 'package:pmf_website/features/cups/presentation/views/widgets/cup%20groups%20matches/cup_group_matches_body.dart';
import 'package:pmf_website/responsive/general_scaffold.dart';

class CupGroupsMatchesView extends StatelessWidget {
  const CupGroupsMatchesView({super.key});

  @override
  Widget build(BuildContext context) {
    const id = "";
    return const GeneralScaffold(
      isCupsSelected: true,
      desktopBody: CupGroupsMatchesBody(id: id),
      tabletBody: CupGroupsMatchesBody(id: id),
      mobileBody: CupGroupsMatchesBody(id: id),
    );
  }
}
