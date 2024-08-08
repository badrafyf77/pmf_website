import 'package:flutter/material.dart';
import 'package:pmf_website/features/home/presentation/views/mobile/body.dart';
import 'package:pmf_website/features/home/presentation/views/tablet/body.dart';
import 'package:pmf_website/features/home/presentation/views/desktop/body.dart';
import 'package:pmf_website/responsive/general_scaffold.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const GeneralScaffold(
      isHomeSelected: true,
      desktopBody: DesktopHomeBody(),
      tabletBody: TabletHomeBody(),
      mobileBody: MobileHomeBody(),
    );
  }
}
