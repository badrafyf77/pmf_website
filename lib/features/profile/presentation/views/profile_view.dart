import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pmf_website/features/profile/presentation/manager/get%20user%20info%20cubit/get_user_info_cubit.dart';
import 'package:pmf_website/features/profile/presentation/views/mobile/body.dart';
import 'package:pmf_website/features/profile/presentation/views/desktop/body.dart';
import 'package:pmf_website/responsive/general_scaffold.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key, required this.id});

  final String id;

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetUserInfoCubit>(context).getUser(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return const GeneralScaffold(
      isProfileSelected: true,
      desktopBody: DesktopProfileBody(),
      tabletBody: DesktopProfileBody(),
      mobileBody: MobileProfileBody(),
    );
  }
}
