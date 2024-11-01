import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pmf_website/core/utils/helpers/session.dart';
import 'package:pmf_website/core/utils/styles.dart';
import 'package:pmf_website/features/profile/presentation/manager/get%20user%20info%20cubit/get_user_info_cubit.dart';
import 'package:pmf_website/features/profile/presentation/views/mobile/body.dart';
import 'package:pmf_website/features/profile/presentation/views/desktop/body.dart';
import 'package:pmf_website/responsive/general_scaffold.dart';
import 'package:pmf_website/responsive/widgets/sign_in_out_buttons.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  String? id = getId();

  bool isIdNull = false;

  @override
  void initState() {
    super.initState();

    if (id == null) {
      isIdNull = true;
    } else {
      isIdNull = false;
      BlocProvider.of<GetUserInfoCubit>(context).getUser(id!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GeneralScaffold(
      isProfileSelected: true,
      desktopBody:
          isIdNull ? const IdIsNullSignIn() : const DesktopProfileBody(),
      tabletBody:
          isIdNull ? const IdIsNullSignIn() : const DesktopProfileBody(),
      mobileBody: isIdNull ? const IdIsNullSignIn() : const MobileProfileBody(),
    );
  }
}

class IdIsNullSignIn extends StatelessWidget {
  const IdIsNullSignIn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Sign in or Sign up to see your profile",
            style: Styles.normal16.copyWith(color: Colors.grey),
          ),
          const SizedBox(height: 10),
          const SignInButton(),
        ],
      ),
    );
  }
}
