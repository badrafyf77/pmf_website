import 'package:flutter/material.dart';
import 'package:pmf_website/features/cups/presentation/views/widgets/cup%20table/cup_table_body.dart';
import 'package:pmf_website/responsive/general_scaffold.dart';

class CupTableView extends StatelessWidget {
  const CupTableView({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return GeneralScaffold(
      id: id,
      isCupsSelected: true,
      desktopBody: CupTableBody(id: id),
      tabletBody: CupTableBody(id: id),
      mobileBody: CupTableBody(id: id),
    );
  }
}
