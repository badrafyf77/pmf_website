import 'package:flutter/material.dart';
import 'package:pmf_website/features/home/presentation/views/widgets/trophies_body.dart';
import 'package:pmf_website/responsive/general_scaffold.dart';

class TrophiesView extends StatelessWidget {
  const TrophiesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const GeneralScaffold(
      isHomeAppbar: true,
      isTrophiesSelected: true,
      desktopBody: TrophiesBody(),
      tabletBody: TrophiesBody(),
      mobileBody: TrophiesBody(),
    );
  }
}
