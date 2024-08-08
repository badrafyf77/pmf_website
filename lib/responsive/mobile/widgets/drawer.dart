import 'package:flutter/material.dart';
import 'package:mouse_follower/mouse_follower.dart';
import 'package:pmf_website/core/config/app_router.dart';
import 'package:pmf_website/core/utils/app_colors.dart';
import 'package:pmf_website/core/utils/customs/button.dart';
import 'package:pmf_website/core/utils/customs/list_view.dart';
import 'package:pmf_website/core/utils/customs/logo.dart';
import 'package:pmf_website/responsive/mobile/widgets/drawer_item.dart';

class MobileDrawer extends StatelessWidget {
  const MobileDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return MouseOnHoverEvent(
      customOnHoverMouseStylesStack: [
        MouseStyle(
          size: const Size(50, 50),
          latency: const Duration(milliseconds: 25),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).colorScheme.primary.withAlpha(150),
          ),
        ),
      ],
      child: Drawer(
        backgroundColor: Colors.white,
        child: CustomListView(
          children: [
            UnconstrainedBox(
              child: DrawerHeader(
                child: Container(
                  decoration: const BoxDecoration(
                    color: AppColors.kPrimaryColor,
                    shape: BoxShape.circle,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: AppLogo(
                      height: 80,
                      width: 85,
                      blackLogo: true,
                    ),
                  ),
                ),
              ),
            ),
            DrawerItem(
              text: 'ACCUEIL',
              icon: Icons.home,
              onTap: () {
                AppRouter.navigateTo(context, AppRouter.home);
              },
            ),
            DrawerItem(
              text: 'À PROPOS',
              icon: Icons.info,
              onTap: () {},
            ),
            DrawerItem(
              text: 'ÉVÉNEMENTS',
              icon: Icons.event,
              onTap: () {},
            ),
            DrawerItem(
              text: 'ACTIVITÉS PROPOSÉES',
              icon: Icons.assignment,
              onTap: () {},
            ),
            DrawerItem(
              text: 'GALERIE',
              icon: Icons.collections,
              onTap: () {},
            ),
            DrawerItem(
              text: 'PARTENAIRES',
              icon: Icons.people,
              onTap: () {},
            ),
            const SizedBox(
              height: 15,
            ),
            CustomButton(
              onPressed: () {},
              textButton: 'CONTACT',
              backgroundColor: AppColors.kPrimaryColor,
              height: 35,
              width: 130,
              radius: 10,
              textColor: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
