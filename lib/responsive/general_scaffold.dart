import 'package:flutter/material.dart';
import 'package:pmf_website/responsive/desktop/desktop_scaffold.dart';
import 'package:pmf_website/responsive/mobile/mobile_scaffold.dart';
import 'package:pmf_website/responsive/tablet/tablet_scaffold.dart';

class GeneralScaffold extends StatelessWidget {
  const GeneralScaffold({
    super.key,
    this.isProfileSelected = false,
    this.isLeaguesSelected = false,
    this.isTrophiesSelected = false,
    this.isGallerySelected = false,
    this.isUserTermsSelected = false,
    this.isPartnersSelected = false,
    this.isEventsSelected = false,
    required this.desktopBody,
    required this.tabletBody,
    required this.mobileBody,
  });

  final bool isProfileSelected;
  final bool isLeaguesSelected;
  final bool isEventsSelected;
  final bool isTrophiesSelected;
  final bool isGallerySelected;
  final bool isUserTermsSelected;
  final bool isPartnersSelected;
  final Widget desktopBody;
  final Widget tabletBody;
  final Widget mobileBody;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 920) {
        return DesktopScaffold(
          isHomeSelected: isProfileSelected,
          isAboutSelected: isLeaguesSelected,
          isEventsSelected: isEventsSelected,
          isTrophiesSelected: isTrophiesSelected,
          isGallerySelected: isGallerySelected,
          isUserTermsSelected: isUserTermsSelected,
          isPartnersSelected: isPartnersSelected,
          body: desktopBody,
        );
      }
      if (constraints.maxWidth > 640) {
        return TabletScaffold(
          body: tabletBody,
        );
      }
      return MobileScaffold(
        body: mobileBody,
      );
    });
  }
}
