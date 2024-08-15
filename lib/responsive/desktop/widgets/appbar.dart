import 'package:flutter/material.dart';
import 'package:pmf_website/responsive/desktop/widgets/appbar_content.dart';

class DesktopAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DesktopAppBar({
    super.key,
    required this.isHomeAppbar,
    required this.isHomeSelected,
    required this.isTrophiesSelected,
    required this.isProfileSelected,
    required this.isLeaguesSelected,
    required this.isCupsSelected,
  });

  final bool isHomeAppbar;
  final bool isHomeSelected;
  final bool isTrophiesSelected;
  final bool isProfileSelected;
  final bool isLeaguesSelected;
  final bool isCupsSelected;

  @override
  Size get preferredSize => const Size.fromHeight(100);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: AppbarContent(
        isHomeAppbar: isHomeAppbar,
        isHomeSelected: isHomeSelected,
        isTrophiesSelected: isTrophiesSelected,
        isProfileSelected: isProfileSelected,
        isLeaguesSelected: isLeaguesSelected,
        isCupsSelected: isCupsSelected,
      ),
    );
  }
}
