import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pmf_website/features/trophies/presentation/views/home_view.dart';
import 'package:pmf_website/responsive/general_scaffold.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const GeneralScaffold(
      isHomeAppbar: true,
      isHomeSelected: true,
      desktopBody: HomeBody(),
      tabletBody: HomeBody(),
      mobileBody: HomeBody(),
    );
  }
}