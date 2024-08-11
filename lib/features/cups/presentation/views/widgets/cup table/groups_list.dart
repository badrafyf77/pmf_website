import 'package:flutter/material.dart';
import 'package:pmf_website/features/cups/presentation/views/widgets/cup%20table/group_table.dart';

class GroupsList extends StatelessWidget {
  const GroupsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 8,
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.only(bottom: 15),
          child: GroupTable(),
        );
      },
    );
  }
}