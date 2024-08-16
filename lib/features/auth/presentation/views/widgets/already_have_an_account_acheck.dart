import 'package:flutter/material.dart';
import 'package:pmf_website/core/utils/app_colors.dart';
import 'package:pmf_website/core/utils/styles.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final Function? press;
  const AlreadyHaveAnAccountCheck({
    super.key,
    this.login = true,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? "Don’t have an Account ? " : "Already have an Account ? ",
          style: Styles.normal14.copyWith(color: AppColors.kPrimaryColor),
        ),
        GestureDetector(
          onTap: press as void Function()?,
          child: Text(
            login ? "Sign Up" : "Sign In",
            style: Styles.normal14.copyWith(fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
