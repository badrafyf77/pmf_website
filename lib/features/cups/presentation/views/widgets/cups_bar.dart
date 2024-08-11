import 'package:flutter/material.dart';
import 'package:pmf_website/core/utils/customs/views_title.dart';
import 'package:pmf_website/features/cups/presentation/views/widgets/cups_bar_items.dart';

class CupBar extends StatelessWidget {
  const CupBar({
    super.key,
    this.isTableSelected = false,
    this.isGroupsMatchesSelected = false,
    this.isKnockoutSelected = false,
  });

  final bool isTableSelected;
  final bool isGroupsMatchesSelected;
  final bool isKnockoutSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ViewsTitle(title: "PMF World Cup"),
        const SizedBox(height: 15),
        CupBarItems(
          isTableSelected: isTableSelected,
          isGroupsMatchesSelected: isGroupsMatchesSelected,
          isKnockoutSelected: isKnockoutSelected,
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}