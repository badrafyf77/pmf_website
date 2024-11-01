import 'package:flutter/material.dart';
import 'package:pmf_website/features/cups/presentation/views/widgets/cup%20table/cup_table_body.dart';
import 'package:pmf_website/responsive/general_scaffold.dart';

class CupTableView extends StatelessWidget {
  const CupTableView({super.key});

  @override
  Widget build(BuildContext context) {
    const id = "";
    return const GeneralScaffold(
      isCupsSelected: true,
      desktopBody: CupTableBody(id: id),
      tabletBody: CupTableBody(id: id),
      mobileBody: CupTableBody(id: id),
    );
  }
}
