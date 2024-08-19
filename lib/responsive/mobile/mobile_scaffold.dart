import 'package:flutter/material.dart';
import 'package:pmf_website/responsive/mobile/widgets/m_t_appbar.dart';
import 'package:pmf_website/responsive/mobile/widgets/drawer.dart';

class MobileScaffold extends StatelessWidget {
  const MobileScaffold({
    super.key,
    required this.body,
    required this.isHomeAppbar,
    required this.id,
  });

  final Widget body;
  final bool isHomeAppbar;
  final String id;

  @override
  Widget build(BuildContext context) {
    return TooltipVisibility(
      visible: false,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: const MobileAppBar(),
        endDrawer:
            isHomeAppbar ? const MobileHomeDrawer() : MobileDrawer(id: id),
        body: body,
      ),
    );
  }
}
