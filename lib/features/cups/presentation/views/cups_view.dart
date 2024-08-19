import 'package:flutter/material.dart';
import 'package:pmf_website/features/cups/presentation/views/widgets/cups/cups_body.dart';
import 'package:pmf_website/responsive/general_scaffold.dart';

class CupsView extends StatelessWidget {
  const CupsView({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return GeneralScaffold(
      id: id,
      isCupsSelected: true,
      desktopBody: CupsBody(id: id),
      tabletBody: CupsBody(id: id),
      mobileBody: CupsBody(id: id),
    );
  }
}
