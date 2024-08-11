import 'package:flutter/material.dart';
import 'package:pmf_website/core/config/app_router.dart';
import 'package:pmf_website/core/utils/app_colors.dart';
import 'package:pmf_website/core/utils/customs/horizontal_line.dart';
import 'package:pmf_website/features/leagues/presentation/views/widgets/bar_item.dart';

class CupBarItems extends StatelessWidget {
  const CupBarItems({
    super.key,
    required this.isTableSelected,
    required this.isGroupsMatchesSelected,
    required this.isKnockoutSelected,
  });

  final bool isTableSelected;
  final bool isGroupsMatchesSelected;
  final bool isKnockoutSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * .05,
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  BarItem(
                    value: "TABLE",
                    lineWidth: 45,
                    onTap: () {
                      AppRouter.navigateTo(context, AppRouter.cupTable);
                    },
                    isSelected: isTableSelected,
                  ),
                  const SizedBox(width: 10),
                  BarItem(
                    value: "GROUPS MATCHES",
                    lineWidth: 137,
                    onTap: () {
                      AppRouter.navigateTo(context, AppRouter.cupGroupsMatches);
                    },
                    isSelected: isGroupsMatchesSelected,
                  ),
                  const SizedBox(width: 10),
                  BarItem(
                    value: "KNOCKOUT STAGE",
                    lineWidth: 137,
                    onTap: () {
                      AppRouter.navigateTo(context, AppRouter.cupKnockoutStage);
                    },
                    isSelected: isKnockoutSelected,
                  ),
                ],
              ),
            ),
          ),
        ),
        HorizontalLine(
          height: .5,
          color: AppColors.kSecondColor,
        ),
      ],
    );
  }
}