import 'package:flutter/material.dart';
import 'package:pmf_website/core/config/app_router.dart';
import 'package:pmf_website/core/utils/customs/logo.dart';
import 'package:pmf_website/core/utils/helpers/session.dart';
import 'package:pmf_website/responsive/desktop/widgets/appbar_item.dart';
import 'package:pmf_website/responsive/widgets/sign_in_out_buttons.dart';

class AppbarContent extends StatelessWidget {
  const AppbarContent({
    super.key,
    required this.isHomeSelected,
    required this.isTrophiesSelected,
    required this.isProfileSelected,
    required this.isLeaguesSelected,
    required this.isCupsSelected,
    required this.isSettingsSelected,
  });

  final bool isHomeSelected;
  final bool isTrophiesSelected;
  final bool isProfileSelected;
  final bool isLeaguesSelected;
  final bool isCupsSelected;
  final bool isSettingsSelected;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const AppLogo(),
        AppbarItems(
          isHomeSelected: isHomeSelected,
          isProfileSelected: isProfileSelected,
          isLeaguesSelected: isLeaguesSelected,
          isCupsSelected: isCupsSelected,
          isTrophiesSelected: isTrophiesSelected,
          isSettingsSelected: isSettingsSelected,
        ),
        getId() == null ? const SignInButton() : const LogoutButton(),
      ],
    );
  }
}

class AppbarItems extends StatelessWidget {
  const AppbarItems({
    super.key,
    required this.isProfileSelected,
    required this.isLeaguesSelected,
    required this.isCupsSelected,
    required this.isHomeSelected,
    required this.isSettingsSelected,
    required this.isTrophiesSelected,
  });

  final bool isProfileSelected;
  final bool isLeaguesSelected;
  final bool isCupsSelected;
  final bool isHomeSelected;
  final bool isSettingsSelected;
  final bool isTrophiesSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            AppBarItem(
              isSelected: isHomeSelected,
              text: 'HOME',
              onPressed: () {
                AppRouter.navigateTo(context, AppRouter.home);
              },
            ),
            const SizedBox(width: 8),
            AppBarItem(
              isSelected: isProfileSelected,
              text: 'PROFILE',
              onPressed: () {
                AppRouter.navigateTo(context, AppRouter.profile);
              },
            ),
            const SizedBox(width: 8),
            AppBarItem(
              isSelected: isLeaguesSelected,
              text: 'LEAGUES',
              onPressed: () {
                AppRouter.navigateTo(context, AppRouter.leagues);
              },
            ),
            if (getId() != null) const SizedBox(width: 8),
            if (getId() != null)
              AppBarItem(
                isSelected: isSettingsSelected,
                text: 'SETTINGS',
                onPressed: () {
                  AppRouter.navigateTo(context, AppRouter.settings);
                },
              ),
          ],
        ),
      ),
    );
  }
}
