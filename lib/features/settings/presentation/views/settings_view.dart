import 'package:flutter/material.dart';
import 'package:pmf_website/features/settings/presentation/views/widgets/settings_body.dart';
import 'package:pmf_website/responsive/general_scaffold.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return GeneralScaffold(
      id: id,
      desktopBody: SettingsBody(id: id),
      tabletBody: SettingsBody(id: id),
      mobileBody: SettingsBody(id: id),
    );
  }
}