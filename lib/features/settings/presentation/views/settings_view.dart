import 'package:flutter/material.dart';
import 'package:pmf_website/responsive/general_scaffold.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return GeneralScaffold(
      id: id,
      desktopBody: const SettingsBody(),
      tabletBody: const SettingsBody(),
      mobileBody: const SettingsBody(),
    );
  }
}

class SettingsBody extends StatelessWidget {
  const SettingsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
