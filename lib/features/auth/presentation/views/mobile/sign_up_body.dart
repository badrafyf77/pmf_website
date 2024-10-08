import 'package:flutter/material.dart';
import 'package:pmf_website/core/utils/customs/column_fade_animation.dart';
import 'package:pmf_website/core/utils/customs/list_view.dart';
import 'package:pmf_website/features/auth/presentation/views/widgets/auth_image.dart';
import 'package:pmf_website/features/auth/presentation/views/widgets/signup_form.dart';

class MobileSignUpBody extends StatelessWidget {
  const MobileSignUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomListView(
      children: [
        ColumnFadeInAnimation(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AuthImage(),
            Row(
              children: [
                Spacer(),
                Expanded(
                  flex: 8,
                  child: SignUpForm(),
                ),
                Spacer(),
              ],
            ),
            SizedBox(height: 50),
          ],
        ),
      ],
    );
  }
}
