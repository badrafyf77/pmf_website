import 'package:flutter/material.dart';
import 'package:pmf_website/features/profile/presentation/views/mobile/body.dart';
import 'package:pmf_website/features/profile/presentation/views/tablet/body.dart';
import 'package:pmf_website/features/profile/presentation/views/desktop/body.dart';
import 'package:pmf_website/responsive/general_scaffold.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const GeneralScaffold(
      isProfileSelected: true,
      desktopBody: DesktopProfileBody(),
      tabletBody: TabletProfileBody(),
      mobileBody: MobileProfileBody(),
    );
  }
}
