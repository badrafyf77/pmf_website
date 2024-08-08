// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:pmf_website/responsive/mobile/widgets/m_t_appbar.dart';
import 'package:pmf_website/responsive/mobile/widgets/drawer.dart';

class TabletScaffold extends StatelessWidget {
  const TabletScaffold({
    super.key,
    required this.body,
  });

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return TooltipVisibility(
      visible: false,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: const MobileAppBar(),
        endDrawer: const MobileDrawer(),
        body: body,
      ),
    );
  }
}
