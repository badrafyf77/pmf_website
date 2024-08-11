import 'package:flutter/material.dart';
import 'package:pmf_website/core/models/player_model.dart';
import 'package:pmf_website/core/utils/styles.dart';
import 'package:pmf_website/features/leagues/presentation/views/widgets/league%20table/table.dart';

class GroupTable extends StatelessWidget {
  const GroupTable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * .05,
          ),
          child: Text(
            "GROUP A",
            style: Styles.normal16.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        StandingTable(playersList: List.from(groupPlayers)),
      ],
    );
  }
}