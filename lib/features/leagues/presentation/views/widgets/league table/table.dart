import 'package:flutter/material.dart';
import 'package:pmf_website/core/models/player_model.dart';
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

    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          width: constraints.maxWidth,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: ConstrainedBox(
              constraints: BoxConstraints(minWidth: constraints.maxWidth),
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
          ),
        );
      },
    );
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
    return data.map((p) {
      i++;
      return DataRow(
        color: WidgetStatePropertyAll(((i % 2) == 0)
            ? AppColors.kSecondColor
            : Colors.grey.withAlpha(50)),
        cells: [
          DataCell(
            CellRowItem(
              title: i.toString(),
              fontColor: (i > 15)
                  ? Colors.red
                  : (i <= 4)
                      ? Colors.green
                      : Colors.grey,
            ),
          ),
          DataCell(
            CellRowItem(
              title: p.name,
            ),
          ),
          DataCell(
            CellRowItem(
              title: p.played.toString(),
              fontColor: Colors.grey,
            ),
          ),
          DataCell(
            CellRowItem(
              title: p.wins.toString(),
              fontColor: Colors.green,
            ),
          ),
          DataCell(
            CellRowItem(
              title: p.draws.toString(),
              fontColor: Colors.grey,
            ),
          ),
          DataCell(
            CellRowItem(title: p.losses.toString(), fontColor: Colors.red),
          ),
          DataCell(
            CellRowItem(
              title: p.scored.toString(),
              fontColor: Colors.grey,
            ),
          ),
          DataCell(
            CellRowItem(
              title: p.conceded.toString(),
              fontColor: Colors.grey,
            ),
          ),
          DataCell(
            CellRowItem(
              title: p.goalDef > 0 ? "+${p.goalDef}" : p.goalDef.toString(),
              fontColor: p.goalDef >= 0 ? Colors.green : Colors.red,
            ),
          ),
          DataCell(
            CellRowItem(
              title: p.pts.toString(),
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
