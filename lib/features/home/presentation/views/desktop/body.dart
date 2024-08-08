import 'package:flutter/material.dart';
import 'package:pmf_website/core/utils/customs/app_footer.dart';
import 'package:pmf_website/core/utils/customs/column_fade_animation.dart';
import 'package:pmf_website/core/utils/customs/list_view.dart';
import 'package:pmf_website/features/home/presentation/views/desktop/widgets/first_body_part.dart';

class DesktopHomeBody extends StatelessWidget {
  const DesktopHomeBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CustomListView(
      children: [
        ColumnFadeInAnimation(
          children: [
            FirstPart(),
            AppFooter(),
          ],
        ),
      ],
    );
  }
}
