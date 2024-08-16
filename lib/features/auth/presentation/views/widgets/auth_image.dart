import 'package:flutter/material.dart';
import 'package:pmf_website/core/utils/customs/logo.dart';

class AuthImage extends StatelessWidget {
  const AuthImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Spacer(),
        Expanded(
          flex: 8,
          child: AppLogo(
            width: 300,
            height: 350,
          ),
        ),
        Spacer(),
      ],
    );
  }
}
