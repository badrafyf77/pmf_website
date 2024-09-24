import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pmf_website/features/leagues/presentation/manager/cubit/leagues_cubit.dart';
import 'package:pmf_website/features/leagues/presentation/views/widgets/league%20table/league_table_body.dart';
import 'package:pmf_website/responsive/general_scaffold.dart';

class LeagueTableView extends StatefulWidget {
  const LeagueTableView({super.key, required this.id, required this.leagueId});

  final String id;
  final String leagueId;

  @override
  State<LeagueTableView> createState() => _LeagueTableViewState();
}

class _LeagueTableViewState extends State<LeagueTableView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<LeaguesCubit>(context).getPlayers(widget.leagueId);
  }
  @override
  Widget build(BuildContext context) {
    return GeneralScaffold(
      id: widget.id,
      isLeaguesSelected: true,
      desktopBody: LeagueTableBody(id: widget.id, leagueId: widget.leagueId),
      tabletBody: LeagueTableBody(id: widget.id, leagueId: widget.leagueId),
      mobileBody: LeagueTableBody(id: widget.id, leagueId: widget.leagueId),
    );
  }
}
