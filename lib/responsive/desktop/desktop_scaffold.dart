import 'package:flutter/material.dart';
import 'package:pmf_website/responsive/desktop/widgets/appbar.dart';

class DesktopScaffold extends StatelessWidget {
  const DesktopScaffold({
    super.key,
    required this.body,
    required this.isHomeSelected,
    required this.isTrophiesSelected,
    required this.isProfileSelected,
    required this.isLeaguesSelected,
    required this.isCupsSelected, required this.isSettingsSelected,
  });

  final bool isHomeSelected;
  final bool isTrophiesSelected;
  final bool isProfileSelected;
  final bool isLeaguesSelected;
  final bool isCupsSelected;
  final bool isSettingsSelected;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return TooltipVisibility(
      visible: false,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: DesktopAppBar(
          isHomeSelected: isHomeSelected,
          isTrophiesSelected: isTrophiesSelected,
          isProfileSelected: isProfileSelected,
          isLeaguesSelected: isLeaguesSelected,
          isCupsSelected: isCupsSelected,
          isSettingsSelected: isSettingsSelected,
        ),
        body: body,
      ),
    );
  }
}
