// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:pmf_website/responsive/desktop/widgets/appbar.dart';

class DesktopScaffold extends StatelessWidget {
  const DesktopScaffold({
    super.key,
    required this.body,
    required this.isProfileSelected,
    required this.isLeaguesSelected,
    required this.isCupsSelected,
    required this.isTrophiesSelected,
  });

  final bool isProfileSelected;
  final bool isLeaguesSelected;
  final bool isCupsSelected;
  final bool isTrophiesSelected;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return TooltipVisibility(
      visible: false,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: DesktopAppBar(
          isProfileSelected: isProfileSelected,
          isLeaguesSelected: isLeaguesSelected,
          isCupsSelected: isCupsSelected,
          isTrophiesSelected: isTrophiesSelected,
        ),
        body: body,
      ),
    );
  }
}
