import 'package:flutter/material.dart';
import 'package:mouse_follower/mouse_follower.dart';
import 'package:pmf_website/core/config/app_router.dart';
import 'package:pmf_website/core/utils/app_colors.dart';
import 'package:pmf_website/core/utils/customs/list_view.dart';
import 'package:pmf_website/core/utils/customs/logo.dart';
import 'package:pmf_website/responsive/desktop/widgets/appbar_content.dart';
import 'package:pmf_website/responsive/mobile/widgets/drawer_item.dart';

class MobileDrawer extends StatelessWidget {
  const MobileDrawer({super.key, required this.id});

  final String id;

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
              text: 'PROFILE',
              icon: Icons.home,
              onTap: () {
                AppRouter.navigateToWithUrlParametre(
                    context, AppRouter.profile, 'id', id);
              },
            ),
            DrawerItem(
              text: 'LEAGUES',
              icon: Icons.info,
              onTap: () {
                AppRouter.navigateToWithUrlParametre(
                    context, AppRouter.leagues, 'id', id);
              },
            ),
            DrawerItem(
              text: 'CUPS',
              icon: Icons.event,
              onTap: () {
                AppRouter.navigateToWithUrlParametre(
                    context, AppRouter.cups, 'id', id);
              },
            ),
            const SizedBox(
              height: 15,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.person,
                color: AppColors.kPrimaryColor,
                size: 35,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MobileHomeDrawer extends StatelessWidget {
  const MobileHomeDrawer({super.key});

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
              text: 'HOME',
              icon: Icons.home,
              onTap: () {
                AppRouter.navigateTo(context, AppRouter.home);
              },
            ),
            DrawerItem(
              text: 'TROPHIES',
              icon: Icons.assignment,
              onTap: () {
                AppRouter.navigateTo(context, AppRouter.trophies);
              },
            ),
            const SizedBox(
              height: 15,
            ),
            const SignInButton()
          ],
        ),
      ),
    );
  }
}
