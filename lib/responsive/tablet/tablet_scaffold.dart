import 'package:flutter/material.dart';
import 'package:pmf_website/responsive/mobile/widgets/m_t_appbar.dart';
import 'package:pmf_website/responsive/mobile/widgets/drawer.dart';

class TabletScaffold extends StatelessWidget {
  const TabletScaffold({
    super.key,
    required this.body,
    required this.isHomeAppbar,
  });

  final Widget body;
  final bool isHomeAppbar;

  @override
  Widget build(BuildContext context) {
    return TooltipVisibility(
      visible: false,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: const MobileAppBar(),
        endDrawer:
            isHomeAppbar ? const MobileHomeDrawer() : const MobileDrawer(),
        body: body,
      ),
    );
  }
}
