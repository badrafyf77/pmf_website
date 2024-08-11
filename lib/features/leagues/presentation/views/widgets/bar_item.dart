import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pmf_website/core/utils/customs/horizontal_line.dart';
import 'package:pmf_website/core/utils/styles.dart';

class BarItem extends StatelessWidget {
  const BarItem({
    super.key,
    this.isSelected = false,
    required this.value,
    required this.onTap,
    required this.lineWidth,
  });

  final String value;
  final double lineWidth;
  final bool isSelected;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: AutoSizeText(
            value,
            style: Styles.normal16.copyWith(
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.white : Colors.grey,
            ),
            maxLines: 1,
          ),
        ),
        if (isSelected)
          SizedBox(
            width: lineWidth,
            child: const HorizontalLine(),
          ),
      ],
    );
  }
}
