import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pmf_website/core/utils/app_colors.dart';
import 'package:pmf_website/core/utils/constants.dart';
import 'package:pmf_website/core/utils/customs/horizontal_line.dart';
import 'package:pmf_website/core/utils/helpers/launch_url.dart';
import 'package:pmf_website/core/utils/styles.dart';

class AppFooter extends StatelessWidget {
  const AppFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HorizontalLine(
          height: .5,
        ),
        Container(
          height: 150,
          color: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialMediaItem(
                    onPressed: () {},
                    icon: Icons.facebook,
                    backgroundColor: Colors.blue,
                  ),
                  const SizedBox(width: 10),
                  SocialMediaItem(
                    onPressed: () {
                      customLaunchUrl(Constants.eventsWeekInstagram);
                    },
                    icon: FontAwesomeIcons.instagram,
                    backgroundColor: const Color(0xFFD72072),
                  ),
                  const SizedBox(width: 10),
                  SocialMediaItem(
                    onPressed: () {},
                    icon: FontAwesomeIcons.linkedin,
                    backgroundColor: Colors.blue,
                  ),
                  const SizedBox(width: 10),
                  SocialMediaItem(
                    onPressed: () {},
                    icon: FontAwesomeIcons.xTwitter,
                    backgroundColor: Colors.grey,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              AutoSizeText(
                'Contact@eventsweek.org',
                style: Styles.normal12.copyWith(
                  fontWeight: FontWeight.normal,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                ),
              ),
              AutoSizeText(
                "Droits d'auteur © 2024 Tous droits réservés - Association Events Week",
                style: Styles.normal12.copyWith(
                  fontWeight: FontWeight.normal,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                ),
                textAlign: TextAlign.center,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AutoSizeText(
                    'Propulsé par:',
                    style: Styles.normal14.copyWith(
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      customLaunchUrl(Constants.afyfLinkedIn);
                    },
                    style: ElevatedButton.styleFrom(
                      splashFactory: NoSplash.splashFactory,
                      padding: EdgeInsets.zero,
                      overlayColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      foregroundColor: Colors.transparent,
                      backgroundColor: Colors.transparent,
                    ),
                    child: AutoSizeText(
                      '  AFYF Badreddine',
                      style: Styles.normal12.copyWith(
                        color: AppColors.kPrimaryColor,
                        fontWeight: FontWeight.normal,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class SocialMediaItem extends StatefulWidget {
  const SocialMediaItem({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.backgroundColor,
  });

  final void Function() onPressed;
  final IconData icon;
  final Color backgroundColor;

  @override
  State<SocialMediaItem> createState() => _SocialMediaItemState();
}

class _SocialMediaItemState extends State<SocialMediaItem> {
  bool isHovering = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          isHovering = true;
        });
      },
      onExit: (event) {
        setState(() {
          isHovering = false;
        });
      },
      child: Container(
        height: 28,
        width: 28,
        decoration: BoxDecoration(
          color: isHovering ? widget.backgroundColor : Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: IconButton(
          padding: const EdgeInsets.all(0.0),
          onPressed: widget.onPressed,
          icon: Icon(
            widget.icon,
            color: Colors.white,
            size: 24,
          ),
        ),
      ),
    );
  }
}
