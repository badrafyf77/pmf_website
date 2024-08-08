import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pmf_website/core/utils/app_colors.dart';
import 'package:pmf_website/core/utils/customs/horizontal_line.dart';
import 'package:pmf_website/core/utils/customs/logo.dart';
import 'package:pmf_website/core/utils/styles.dart';

class ViewsTitle extends StatelessWidget {
  const ViewsTitle({
    super.key,
    required this.title,
    required this.lineWidth,
    this.withLogo = true,
  });

  final String title;
  final double lineWidth;
  final bool withLogo;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        children: [
          if (withLogo)
            const AppLogo(
              height: 120,
              width: 200,
            ),
          AutoSizeText(
            title,
            style: Styles.normal35,
            maxLines: 1,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            width: lineWidth,
            child: const HorizontalLine(
              color: AppColors.kPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
