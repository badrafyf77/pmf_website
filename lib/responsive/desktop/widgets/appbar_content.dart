import 'package:flutter/material.dart';
import 'package:pmf_website/core/config/app_router.dart';
import 'package:pmf_website/core/utils/app_colors.dart';
import 'package:pmf_website/core/utils/customs/button.dart';
import 'package:pmf_website/core/utils/customs/logo.dart';
import 'package:pmf_website/responsive/desktop/widgets/appbar_item.dart';

class AppbarContent extends StatelessWidget {
  const AppbarContent({
    super.key,
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

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const AppLogo(),
        AppbarItems(
          isHomeSelected: isHomeSelected,
          isAboutSelected: isAboutSelected,
          isEventsSelected: isEventsSelected,
          isActivitiesSelected: isActivitiesSelected,
          isGallerySelected: isGallerySelected,
          isUserTermsSelected: isUserTermsSelected,
          isPartnersSelected: isPartnersSelected,
        ),
        const ContactButton(),
      ],
    );
  }
}

class ContactButton extends StatelessWidget {
  const ContactButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onPressed: () {},
      textButton: 'Settings',
      backgroundColor: AppColors.kPrimaryColor,
      textColor: Colors.black,
      height: 35,
      width: MediaQuery.of(context).size.width * 0.13,
    );
  }
}

class AppbarItems extends StatelessWidget {
  const AppbarItems({
    super.key,
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
            text: 'Profile',
            onPressed: () {
              AppRouter.navigateTo(context, AppRouter.home);
            },
          ),
          const SizedBox(width: 8),
          AppBarItem(
            isSelected: isAboutSelected,
            text: 'Leagues',
            onPressed: () {
              AppRouter.navigateTo(context, AppRouter.leagues);
            },
          ),
          const SizedBox(width: 8),
          AppBarItem(
            isSelected: isEventsSelected,
            text: 'Cups',
            onPressed: () {},
          ),
          const SizedBox(width: 8),
          AppBarItem(
            isSelected: isActivitiesSelected,
            text: 'Trophies',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
