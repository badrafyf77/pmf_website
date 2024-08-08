import 'package:flutter/material.dart';
import 'package:pmf_website/responsive/desktop/desktop_scaffold.dart';
import 'package:pmf_website/responsive/mobile/mobile_scaffold.dart';
import 'package:pmf_website/responsive/tablet/tablet_scaffold.dart';

class GeneralScaffold extends StatelessWidget {
  const GeneralScaffold({
    super.key,
    this.isHomeSelected = false,
    this.isAboutSelected = false,
    this.isActivitiesSelected = false,
    this.isGallerySelected = false,
    this.isUserTermsSelected = false,
    this.isPartnersSelected = false,
    this.isEventsSelected = false,
    required this.desktopBody,
    required this.tabletBody,
    required this.mobileBody,
  });

  final bool isHomeSelected;
  final bool isAboutSelected;
  final bool isEventsSelected;
  final bool isActivitiesSelected;
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
          isHomeSelected: isHomeSelected,
          isAboutSelected: isAboutSelected,
          isEventsSelected: isEventsSelected,
          isActivitiesSelected: isActivitiesSelected,
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
