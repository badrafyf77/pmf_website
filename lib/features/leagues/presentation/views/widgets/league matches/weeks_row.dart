import 'package:flutter/material.dart';
import 'package:pmf_website/core/utils/styles.dart';

class WeeksRow extends StatelessWidget {
  const WeeksRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.chevron_left,
            color: Colors.grey,
          ),
          highlightColor: Colors.white,
        ),
        const SizedBox(width: 50),
        Text(
          "Week 28",
          style: Styles.normal20.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
        const SizedBox(width: 50),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.chevron_right,
            color: Colors.grey,
          ),
          highlightColor: Colors.white,
        ),
      ],
    );
  }
}