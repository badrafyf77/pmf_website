import 'package:flutter/material.dart';
import 'package:pmf_website/responsive/desktop/widgets/appbar_content.dart';

class DesktopAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DesktopAppBar({
    super.key,
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

  @override
  Size get preferredSize => const Size.fromHeight(100);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: AppbarContent(
        isHomeSelected: isHomeSelected,
        isTrophiesSelected: isTrophiesSelected,
        isProfileSelected: isProfileSelected,
        isLeaguesSelected: isLeaguesSelected,
        isCupsSelected: isCupsSelected,
        isSettingsSelected: isSettingsSelected,
      ),
    );
  }
}
