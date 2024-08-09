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
                    color: Colors.black,
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
              text: 'Profile',
              icon: Icons.home,
              onTap: () {
                AppRouter.navigateTo(context, AppRouter.profile);
              },
            ),
            DrawerItem(
              text: 'Leagues',
              icon: Icons.info,
              onTap: () {
                AppRouter.navigateTo(context, AppRouter.leagues);
              },
            ),
            DrawerItem(
              text: 'Cups',
              icon: Icons.event,
              onTap: () {},
            ),
            DrawerItem(
              text: 'Trophies',
              icon: Icons.assignment,
              onTap: () {},
            ),
            const SizedBox(
              height: 15,
            ),
            CustomButton(
              onPressed: () {},
              textButton: 'Settings',
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
