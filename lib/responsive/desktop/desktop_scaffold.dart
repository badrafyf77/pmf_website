// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:pmf_website/responsive/desktop/widgets/appbar.dart';

class DesktopScaffold extends StatelessWidget {
  const DesktopScaffold({
    super.key,
    required this.body,
    required this.isHomeSelected,
    required this.isAboutSelected,
    required this.isEventsSelected,
    required this.isActivitiesSelected,
    required this.isGallerySelected,
    required this.isUserTermsSelected,
    required this.isPartnersSelected,
  });

  final bool isHomeSelected;
  final bool isAboutSelected;
  final bool isEventsSelected;
  final bool isActivitiesSelected;
  final bool isGallerySelected;
  final bool isUserTermsSelected;
  final bool isPartnersSelected;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return TooltipVisibility(
      visible: false,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: DesktopAppBar(
          isHomeSelected: isHomeSelected,
          isAboutSelected: isAboutSelected,
          isEventsSelected: isEventsSelected,
          isActivitiesSelected: isActivitiesSelected,
          isGallerySelected: isGallerySelected,
          isUserTermsSelected: isUserTermsSelected,
          isPartnersSelected: isPartnersSelected,
        ),
        body: body,
      ),
    );
  }
}
