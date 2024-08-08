import 'package:flutter/material.dart';
import 'package:pmf_website/responsive/desktop/widgets/appbar_content.dart';

class DesktopAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DesktopAppBar({
    super.key,
    required this.isProfileSelected,
    required this.isAboutSelected,
    required this.isEventsSelected,
    required this.isActivitiesSelected,
    required this.isGallerySelected,
    required this.isUserTermsSelected,
    required this.isPartnersSelected,
  });

  final bool isProfileSelected;
  final bool isAboutSelected;
  final bool isEventsSelected;
  final bool isActivitiesSelected;
  final bool isGallerySelected;
  final bool isUserTermsSelected;
  final bool isPartnersSelected;

  @override
  Size get preferredSize => const Size.fromHeight(100);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: AppbarContent(
        isHomeSelected: isProfileSelected,
        isAboutSelected: isAboutSelected,
        isEventsSelected: isEventsSelected,
        isActivitiesSelected: isActivitiesSelected,
        isGallerySelected: isGallerySelected,
        isUserTermsSelected: isUserTermsSelected,
        isPartnersSelected: isPartnersSelected,
      ),
    );
  }
}
