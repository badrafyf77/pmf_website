import 'package:flutter/material.dart';
import 'package:pmf_website/features/cups/presentation/views/widgets/cups/cups_body.dart';
import 'package:pmf_website/responsive/general_scaffold.dart';

class CupsView extends StatelessWidget {
  const CupsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const GeneralScaffold(
      isCupsSelected: true,
      desktopBody: CupsBody(),
      tabletBody: CupsBody(),
      mobileBody: CupsBody(),
    );
  }
}