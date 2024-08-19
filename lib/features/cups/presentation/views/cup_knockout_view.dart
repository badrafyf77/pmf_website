import 'package:flutter/material.dart';
import 'package:pmf_website/features/cups/presentation/views/widgets/cup%20knockout/cup_knockout_body.dart';
import 'package:pmf_website/responsive/general_scaffold.dart';

class CupKnockoutView extends StatelessWidget {
  const CupKnockoutView({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return GeneralScaffold(
      id: id,
      isCupsSelected: true,
      desktopBody: CupKnockoutBody(id: id),
      tabletBody: CupKnockoutBody(id: id),
      mobileBody: CupKnockoutBody(id: id),
    );
  }
}
