import 'package:flutter/material.dart';
import 'package:pmf_website/features/cups/presentation/views/widgets/cup%20table/cup_table_body.dart';
import 'package:pmf_website/responsive/general_scaffold.dart';

class CupTableView extends StatelessWidget {
  const CupTableView({super.key});

  @override
  Widget build(BuildContext context) {
    return const GeneralScaffold(
      isCupsSelected: true,
      desktopBody: CupTableBody(),
      tabletBody: CupTableBody(),
      mobileBody: CupTableBody(),
    );
  }
}