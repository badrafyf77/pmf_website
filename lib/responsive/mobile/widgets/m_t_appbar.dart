import 'package:flutter/material.dart';
import 'package:pmf_website/core/utils/app_images.dart';
import 'package:pmf_website/core/utils/customs/logo.dart';

class MobileAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MobileAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(85);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const AppLogo(
        height: 90,
        width: 90,
      ),
      actions: [
        Builder(
          builder: (context) => IconButton(
            icon: Image.asset(
              AppAssets.menu,
              height: 32,
              width: 32,
              color: Colors.white,
            ),
            onPressed: () => Scaffold.of(context).openEndDrawer(),
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          ),
        ),
      ],
      iconTheme: const IconThemeData(
        size: 30,
        color: Colors.white,
      ),
    );
  }
}
