import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pmf_website/core/utils/styles.dart';

class ViewsTitle extends StatelessWidget {
  const ViewsTitle({
    super.key, required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * .05, top: 10, bottom: 10),
      child: AutoSizeText(
        title,
        style: Styles.normal30.copyWith(fontWeight: FontWeight.bold),
        maxLines: 1,
      ),
    );
  }
}
