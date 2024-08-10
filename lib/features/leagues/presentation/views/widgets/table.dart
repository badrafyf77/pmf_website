import 'package:flutter/material.dart';
import 'package:pmf_website/core/utils/app_colors.dart';
import 'package:pmf_website/core/utils/styles.dart';

class LeagueTable extends StatelessWidget {
  const LeagueTable({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Player> data = List.from(
      palyers,
    )..sort((a, b) {
        int ptsComparison = b.pts.compareTo(a.pts);
        if (ptsComparison != 0) return ptsComparison;

        int gdComparison = b.goalDef.compareTo(a.goalDef);
        if (gdComparison != 0) return gdComparison;

        int scoredComparison = b.scored.compareTo(a.scored);
        if (scoredComparison != 0) return scoredComparison;

        return a.conceded.compareTo(b.conceded);
      });

    return LayoutBuilder(builder: (context, constraints) {
      return SizedBox(
        width: constraints.maxWidth,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columns: _createColumns(),
            rows: _createRows(data),
            decoration: BoxDecoration(
              color: AppColors.kSecondColor,
            ),
            border: TableBorder.all(
              color: Colors.black,
            ),
            horizontalMargin: 0,
            columnSpacing: 5,
          ),
        ),
      );
    });
  }

  List<DataColumn> _createColumns() {
    return [
      const DataColumn(
        label: CellColumnItem(title: "Pos"),
      ),
      const DataColumn(
        label: CellColumnItem(title: "Name"),
      ),
      const DataColumn(
        label: CellColumnItem(title: "P"),
      ),
      const DataColumn(
        label: CellColumnItem(title: "W"),
      ),
      const DataColumn(
        label: CellColumnItem(title: "D"),
      ),
      const DataColumn(
        label: CellColumnItem(title: "L"),
      ),
      const DataColumn(
        label: CellColumnItem(title: "F"),
      ),
      const DataColumn(
        label: CellColumnItem(title: "A"),
      ),
      const DataColumn(
        label: CellColumnItem(title: "GD"),
      ),
      const DataColumn(
        label: CellColumnItem(title: "Pts"),
      ),
    ];
  }

  List<DataRow> _createRows(List<Player> data) {
    int i = 0;
    return data.map((c) {
      i++;
      return DataRow(
        cells: [
          DataCell(
            CellRowItem(
              title: i.toString(),
              fontColor: (i > 15)
                  ? Colors.red
                  : (i <= 4)
                      ? Colors.green
                      : Colors.white,
            ),
          ),
          DataCell(
            CellRowItem(
              title: c.name,
            ),
          ),
          DataCell(
            CellRowItem(
              title: c.played.toString(),
              fontColor: Colors.grey,
            ),
          ),
          DataCell(
            CellRowItem(
              title: c.wins.toString(),
              fontColor: Colors.green,
            ),
          ),
          DataCell(
            CellRowItem(
              title: c.draws.toString(),
              fontColor: Colors.grey,
            ),
          ),
          DataCell(
            CellRowItem(title: c.losses.toString(), fontColor: Colors.red),
          ),
          DataCell(
            CellRowItem(
              title: c.scored.toString(),
              fontColor: Colors.green,
            ),
          ),
          DataCell(
            CellRowItem(
              title: c.conceded.toString(),
              fontColor: Colors.red,
            ),
          ),
          DataCell(
            CellRowItem(
              title: c.goalDef.toString(),
              fontColor: c.goalDef >= 0 ? Colors.green : Colors.red,
            ),
          ),
          DataCell(
            CellRowItem(
              title: c.pts.toString(),
              fontColor: Colors.blue,
            ),
          ),
        ],
      );
    }).toList();
  }
}

class CellColumnItem extends StatelessWidget {
  const CellColumnItem({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: Styles.normal16.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

class CellRowItem extends StatelessWidget {
  const CellRowItem({super.key, required this.title, this.fontColor});

  final String title;
  final Color? fontColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: Styles.normal16.copyWith(color: fontColor),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}

class Player {
  final int id;
  final String name;
  final int played;
  final int wins;
  final int draws;
  final int losses;
  final int scored;
  final int conceded;
  final int goalDef;
  final int pts;

  Player({
    required this.id,
    required this.name,
    required this.played,
    required this.wins,
    required this.draws,
    required this.losses,
    required this.scored,
    required this.conceded,
    required this.goalDef,
    required this.pts,
  });
}

List<Player> palyers = [
  Player(
      id: 1,
      name: "John Doe",
      played: 20,
      wins: 12,
      draws: 5,
      losses: 3,
      scored: 30,
      conceded: 15,
      goalDef: 15,
      pts: 41),
  Player(
      id: 2,
      name: "Jane Smith",
      played: 20,
      wins: 10,
      draws: 7,
      losses: 3,
      scored: 25,
      conceded: 18,
      goalDef: 7,
      pts: 37),
  Player(
      id: 3,
      name: "Alex Johnson",
      played: 20,
      wins: 8,
      draws: 8,
      losses: 4,
      scored: 20,
      conceded: 14,
      goalDef: 6,
      pts: 32),
  Player(
      id: 4,
      name: "Chris Brown",
      played: 20,
      wins: 14,
      draws: 3,
      losses: 3,
      scored: 35,
      conceded: 12,
      goalDef: 23,
      pts: 45),
  Player(
      id: 5,
      name: "Patricia Miller",
      played: 20,
      wins: 9,
      draws: 6,
      losses: 5,
      scored: 22,
      conceded: 20,
      goalDef: 2,
      pts: 33),
  Player(
      id: 6,
      name: "Michael Wilson",
      played: 20,
      wins: 11,
      draws: 4,
      losses: 5,
      scored: 28,
      conceded: 17,
      goalDef: 11,
      pts: 37),
  Player(
      id: 7,
      name: "Linda Taylor",
      played: 20,
      wins: 13,
      draws: 3,
      losses: 4,
      scored: 32,
      conceded: 19,
      goalDef: 13,
      pts: 42),
  Player(
      id: 8,
      name: "David Anderson",
      played: 20,
      wins: 7,
      draws: 9,
      losses: 4,
      scored: 19,
      conceded: 16,
      goalDef: 3,
      pts: 30),
  Player(
      id: 9,
      name: "Elizabeth Thomas",
      played: 20,
      wins: 6,
      draws: 10,
      losses: 4,
      scored: 18,
      conceded: 15,
      goalDef: 3,
      pts: 28),
  Player(
      id: 10,
      name: "Richard Jackson",
      played: 20,
      wins: 15,
      draws: 2,
      losses: 3,
      scored: 40,
      conceded: 10,
      goalDef: 30,
      pts: 47),
  Player(
      id: 11,
      name: "Barbara White",
      played: 20,
      wins: 12,
      draws: 4,
      losses: 4,
      scored: 29,
      conceded: 13,
      goalDef: 16,
      pts: 40),
  Player(
      id: 12,
      name: "James Harris",
      played: 20,
      wins: 9,
      draws: 7,
      losses: 4,
      scored: 23,
      conceded: 18,
      goalDef: 5,
      pts: 34),
  Player(
      id: 13,
      name: "Jennifer Martin",
      played: 20,
      wins: 11,
      draws: 5,
      losses: 4,
      scored: 26,
      conceded: 14,
      goalDef: 12,
      pts: 38),
  Player(
      id: 14,
      name: "Robert Thompson",
      played: 20,
      wins: 10,
      draws: 6,
      losses: 4,
      scored: 21,
      conceded: 16,
      goalDef: 8,
      pts: 36),
  Player(
      id: 15,
      name: "Susan Garcia",
      played: 20,
      wins: 8,
      draws: 8,
      losses: 4,
      scored: 21,
      conceded: 19,
      goalDef: 2,
      pts: 36),
  Player(
      id: 16,
      name: "Joseph Martinez",
      played: 20,
      wins: 14,
      draws: 4,
      losses: 2,
      scored: 33,
      conceded: 11,
      goalDef: 22,
      pts: 46),
  Player(
      id: 17,
      name: "Charles Rodriguez",
      played: 20,
      wins: 13,
      draws: 5,
      losses: 2,
      scored: 31,
      conceded: 12,
      goalDef: 19,
      pts: 44),
  Player(
      id: 18,
      name: "Karen Lewis",
      played: 20,
      wins: 12,
      draws: 6,
      losses: 2,
      scored: 28,
      conceded: 13,
      goalDef: 15,
      pts: 42),
  Player(
      id: 19,
      name: "Daniel Lee",
      played: 20,
      wins: 11,
      draws: 7,
      losses: 2,
      scored: 27,
      conceded: 14,
      goalDef: 13,
      pts: 40),
  Player(
      id: 20,
      name: "Nancy Walker",
      played: 20,
      wins: 10,
      draws: 8,
      losses: 2,
      scored: 25,
      conceded: 15,
      goalDef: 10,
      pts: 38)
];
