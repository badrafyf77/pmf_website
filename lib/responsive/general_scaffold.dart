import 'package:flutter/material.dart';
import 'package:pmf_website/responsive/desktop/desktop_scaffold.dart';
import 'package:pmf_website/responsive/mobile/mobile_scaffold.dart';

class GeneralScaffold extends StatelessWidget {
  const GeneralScaffold({
    super.key,
    this.isHomeSelected = false,
    this.isTrophiesSelected = false,
    this.isProfileSelected = false,
    this.isLeaguesSelected = false,
    this.isCupsSelected = false,
    this.isSettingsSelected = false,
    this.isNewsSelected = false,
    required this.desktopBody,
    required this.tabletBody,
    required this.mobileBody,
  });

  final bool isHomeSelected;
  final bool isTrophiesSelected;
  final bool isProfileSelected;
  final bool isLeaguesSelected;
  final bool isCupsSelected;
  final bool isSettingsSelected;
  final bool isNewsSelected;
  final Widget desktopBody;
  final Widget tabletBody;
  final Widget mobileBody;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 920) {
        return DesktopScaffold(
          isHomeSelected: isHomeSelected,
          isTrophiesSelected: isTrophiesSelected,
          isProfileSelected: isProfileSelected,
          isLeaguesSelected: isLeaguesSelected,
          isCupsSelected: isCupsSelected,
          isSettingsSelected: isSettingsSelected,
          isNewsSelected: isNewsSelected,
          body: desktopBody,
        );
      }
      if (constraints.maxWidth > 640) {
        return MobileScaffold(
          body: tabletBody,
        );
      }
      return MobileScaffold(
        body: mobileBody,
      );
    });
  }
}
