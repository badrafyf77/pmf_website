import 'package:flutter/material.dart';
import 'package:pmf_website/features/auth/presentation/views/desktop/sign_up_body.dart';
import 'package:pmf_website/features/auth/presentation/views/mobile/sign_up_body.dart';
import 'package:pmf_website/responsive/general_scaffold.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return const GeneralScaffold(
      isHomeAppbar: true,
      desktopBody: SignUpBody(),
      tabletBody: MobileSignUpBody(),
      mobileBody: MobileSignUpBody(),
    );
  }
}