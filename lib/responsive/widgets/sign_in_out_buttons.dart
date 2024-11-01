import 'package:flutter/material.dart';
import 'package:pmf_website/core/config/app_router.dart';
import 'package:pmf_website/core/services/auth_service.dart';
import 'package:pmf_website/core/utils/app_colors.dart';
import 'package:pmf_website/core/utils/customs/button.dart';
import 'package:pmf_website/core/utils/helpers/session.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onPressed: () {
        AppRouter.navigateTo(context, AppRouter.signIn);
      },
      textButton: 'Sign In',
      backgroundColor: AppColors.kPrimaryColor,
      textColor: Colors.black,
      height: 35,
      width: 120,
    );
  }
}

class LogoutButton extends StatelessWidget {
  const LogoutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onPressed: () {
        removeId();
        AuthService().signOut();
        AppRouter.navigateTo(context, AppRouter.home);
      },
      textButton: "Log out",
      backgroundColor: AppColors.kPrimaryColor,
      height: 40,
    );
  }
}
