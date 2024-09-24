import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pmf_website/features/leagues/presentation/manager/cubit/leagues_cubit.dart';
import 'package:pmf_website/features/leagues/presentation/views/widgets/leagues/leagues_body.dart';
import 'package:pmf_website/responsive/general_scaffold.dart';

class LeaguesView extends StatefulWidget {
  const LeaguesView({super.key, required this.id});

  final String id;

  @override
  State<LeaguesView> createState() => _LeaguesViewState();
}

class _LeaguesViewState extends State<LeaguesView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<LeaguesCubit>(context).getLeagues();
  }

  @override
  Widget build(BuildContext context) {
    return GeneralScaffold(
      id: widget.id,
      isLeaguesSelected: true,
      desktopBody: LeaguesBody(id: widget.id),
      tabletBody: LeaguesBody(id: widget.id),
      mobileBody: LeaguesBody(
        id: widget.id,
        isMobile: true,
      ),
    );
  }
}
