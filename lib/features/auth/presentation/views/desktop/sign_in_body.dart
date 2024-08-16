import 'package:flutter/material.dart';
import 'package:pmf_website/core/utils/customs/column_fade_animation.dart';
import 'package:pmf_website/core/utils/customs/list_view.dart';
import 'package:pmf_website/features/auth/presentation/views/widgets/auth_image.dart';
import 'package:pmf_website/features/auth/presentation/views/widgets/login_form.dart';

class SignInBody extends StatelessWidget {
  const SignInBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomListView(
      children: [
        ColumnFadeInAnimation(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50),
            Row(
              children: [
                Expanded(
                  child: AuthImage(),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 450,
                        child: LoginForm(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
