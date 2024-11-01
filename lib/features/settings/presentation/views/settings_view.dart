import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pmf_website/core/config/app_router.dart';
import 'package:pmf_website/core/utils/helpers/session.dart';
import 'package:pmf_website/features/settings/presentation/manager/cubit/settings_cubit.dart';
import 'package:pmf_website/features/settings/presentation/views/widgets/settings_body.dart';
import 'package:pmf_website/responsive/general_scaffold.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  final id = getId();

  @override
  void initState() {
    super.initState();

    if (id == null) {
      AppRouter.navigateTo(context, AppRouter.home);
    } else {
      BlocProvider.of<SettingsCubit>(context).getUser(id!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GeneralScaffold(
      isSettingsSelected: true,
      desktopBody: SettingsBody(id: id!),
      tabletBody: SettingsBody(id: id!),
      mobileBody: SettingsBody(id: id!),
    );
  }
}
