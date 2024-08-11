import 'package:flutter/material.dart';
import 'package:pmf_website/features/cups/presentation/views/widgets/cup%20knockout/cup_knockout_body.dart';
import 'package:pmf_website/responsive/general_scaffold.dart';

class CupKnockoutView extends StatelessWidget {
  const CupKnockoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return const GeneralScaffold(
      isCupsSelected: true,
      desktopBody: CupKnockoutBody(),
      tabletBody: CupKnockoutBody(),
      mobileBody: CupKnockoutBody(),
    );
  }
}
