import 'package:flutter/material.dart';
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

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
