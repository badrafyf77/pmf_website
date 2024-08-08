// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:pmf_website/core/utils/styles.dart';

class EventsWeekDescription extends StatelessWidget {
  const EventsWeekDescription({
    super.key,
    this.widthPercent = .6,
  });

  final double widthPercent;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * widthPercent,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AutoSizeText(
                'Bienvenue à l\'association Events Week',
                style: Styles.normal45,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
