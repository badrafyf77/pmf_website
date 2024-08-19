import 'package:flutter/material.dart';
import 'package:pmf_website/core/config/app_router.dart';
import 'package:pmf_website/core/utils/app_colors.dart';
import 'package:pmf_website/core/utils/customs/horizontal_line.dart';
import 'package:pmf_website/features/leagues/presentation/views/widgets/bar_item.dart';

class LeagueBarItems extends StatelessWidget {
  const LeagueBarItems({
    super.key,
    required this.isTableSelected,
    required this.isMatchesSelected,
    required this.id,
  });

  final String id;
  final bool isTableSelected;
  final bool isMatchesSelected;

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
                      AppRouter.navigateToWithUrlParametre(
                          context, AppRouter.leagueTable, 'id', id);
                    },
                    isSelected: isTableSelected,
                  ),
                  const SizedBox(width: 10),
                  BarItem(
                    value: "MATCHES",
                    lineWidth: 65,
                    onTap: () {
                      AppRouter.navigateToWithUrlParametre(
                          context, AppRouter.leagueMatches, 'id', id);
                    },
                    isSelected: isMatchesSelected,
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
