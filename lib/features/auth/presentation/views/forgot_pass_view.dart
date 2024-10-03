import 'package:flutter/material.dart';
import 'package:pmf_website/features/auth/presentation/views/desktop/forgot_pass_body.dart';
import 'package:pmf_website/features/auth/presentation/views/mobile/forgot_pass_body.dart';
import 'package:pmf_website/responsive/general_scaffold.dart';

class ForgotPassView extends StatelessWidget {
  const ForgotPassView({super.key});

  @override
  Widget build(BuildContext context) {
    return const GeneralScaffold(
      isHomeAppbar: true,
      desktopBody: ForgotPassBody(),
      tabletBody: MobileForgotPassBody(),
      mobileBody: MobileForgotPassBody(),
    );
  }
}
