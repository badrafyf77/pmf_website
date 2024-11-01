import 'package:flutter/material.dart';
import 'package:pmf_website/features/auth/presentation/views/desktop/sign_in_body.dart';
import 'package:pmf_website/features/auth/presentation/views/mobile/sign_in_body.dart';
import 'package:pmf_website/responsive/general_scaffold.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return const GeneralScaffold(
      desktopBody: SignInBody(),
      tabletBody: MobileSignInBody(),
      mobileBody: MobileSignInBody(),
    );
  }
}



