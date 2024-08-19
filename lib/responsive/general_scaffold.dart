import 'package:flutter/material.dart';
import 'package:pmf_website/responsive/desktop/desktop_scaffold.dart';
import 'package:pmf_website/responsive/mobile/mobile_scaffold.dart';

class GeneralScaffold extends StatelessWidget {
  const GeneralScaffold({
    super.key,
    this.id = '',
    this.isHomeAppbar = false,
    this.isHomeSelected = false,
    this.isTrophiesSelected = false,
    this.isProfileSelected = false,
    this.isLeaguesSelected = false,
    this.isCupsSelected = false,
    required this.desktopBody,
    required this.tabletBody,
    required this.mobileBody,
  });

  final String id;
  final bool isHomeAppbar;
  final bool isHomeSelected;
  final bool isTrophiesSelected;
  final bool isProfileSelected;
  final bool isLeaguesSelected;
  final bool isCupsSelected;
  final Widget desktopBody;
  final Widget tabletBody;
  final Widget mobileBody;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 920) {
        return DesktopScaffold(
          id: id,
          isHomeAppbar: isHomeAppbar,
          isHomeSelected: isHomeSelected,
          isTrophiesSelected: isTrophiesSelected,
          isProfileSelected: isProfileSelected,
          isLeaguesSelected: isLeaguesSelected,
          isCupsSelected: isCupsSelected,
          body: desktopBody,
        );
      }
      if (constraints.maxWidth > 640) {
        return MobileScaffold(
          id: id,
          body: tabletBody,
          isHomeAppbar: isHomeAppbar,
        );
      }
      return MobileScaffold(
        id: id,
        body: mobileBody,
        isHomeAppbar: isHomeAppbar,
      );
    });
  }
}
