import 'package:flutter/material.dart';
import 'package:pmf_website/core/config/app_router.dart';
import 'package:pmf_website/core/utils/app_colors.dart';
import 'package:pmf_website/core/utils/customs/button.dart';
import 'package:pmf_website/core/utils/customs/logo.dart';
import 'package:pmf_website/responsive/desktop/widgets/appbar_item.dart';

class AppbarContent extends StatelessWidget {
  const AppbarContent({
    super.key,
    required this.isHomeAppbar,
    required this.isHomeSelected,
    required this.isTrophiesSelected,
    required this.isProfileSelected,
    required this.isLeaguesSelected,
    required this.isCupsSelected,
    required this.id,
  });

  final String id;
  final bool isHomeAppbar;
  final bool isHomeSelected;
  final bool isTrophiesSelected;
  final bool isProfileSelected;
  final bool isLeaguesSelected;
  final bool isCupsSelected;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const AppLogo(),
        isHomeAppbar
            ? HomeAppbarItems(
                isHomeSelected: isHomeSelected,
                isTrophiesSelected: isTrophiesSelected)
            : AppbarItems(
                id: id,
                isProfileSelected: isProfileSelected,
                isLeaguesSelected: isLeaguesSelected,
                isCupsSelected: isCupsSelected,
              ),
        isHomeAppbar
            ? const SignInButton()
            : IconButton(
                onPressed: () {
                  AppRouter.navigateToWithUrlParametre(
                      context, AppRouter.settings, 'id', id);
                },
                icon: const Icon(
                  Icons.person,
                  color: AppColors.kPrimaryColor,
                  size: 35,
                ),
                highlightColor: Colors.white,
              ),
      ],
    );
  }
}

class SignInButton extends StatelessWidget {
  const SignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onPressed: () {
        AppRouter.navigateTo(context, AppRouter.signIn);
      },
      textButton: 'Sign In',
      backgroundColor: AppColors.kPrimaryColor,
      textColor: Colors.black,
      height: 35,
      width: 120,
    );
  }
}

class AppbarItems extends StatelessWidget {
  const AppbarItems({
    super.key,
    required this.isProfileSelected,
    required this.isLeaguesSelected,
    required this.isCupsSelected,
    required this.id,
  });

  final String id;
  final bool isProfileSelected;
  final bool isLeaguesSelected;
  final bool isCupsSelected;

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
              isSelected: isProfileSelected,
              text: 'PROFILE',
              onPressed: () {
                AppRouter.navigateToWithUrlParametre(
                    context, AppRouter.profile, 'id', id);
              },
            ),
            const SizedBox(width: 8),
            AppBarItem(
              isSelected: isLeaguesSelected,
              text: 'LEAGUES',
              onPressed: () {
                AppRouter.navigateToWithUrlParametre(
                    context, AppRouter.leagues, 'id', id);
              },
            ),
            const SizedBox(width: 8),
            AppBarItem(
              isSelected: isCupsSelected,
              text: 'CUPS',
              onPressed: () {
                AppRouter.navigateToWithUrlParametre(
                    context, AppRouter.cups, 'id', id);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class HomeAppbarItems extends StatelessWidget {
  const HomeAppbarItems({
    super.key,
    required this.isHomeSelected,
    required this.isTrophiesSelected,
  });

  final bool isHomeSelected;
  final bool isTrophiesSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
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
            isSelected: isTrophiesSelected,
            text: 'TROPHIES',
            onPressed: () {
              AppRouter.navigateTo(context, AppRouter.trophies);
            },
          ),
        ],
      ),
    );
  }
}
