import 'package:flutter/material.dart';
import 'package:pmf_website/core/utils/customs/logo.dart';
import 'package:pmf_website/core/utils/customs/pmf_background.dart';
import 'package:pmf_website/features/leagues/data/models/league_model.dart';
import 'package:pmf_website/features/leagues/presentation/views/widgets/leagues/desktop/league_info.dart';

class LeagueCard extends StatelessWidget {
  const LeagueCard({super.key, required this.league});

  final League league;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: PmfBackground(
          height: 280,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: const AppLogo(),
                      ),
                    ),
                    const SizedBox(width: 28),
                    LeagueInfo(
                      league: league,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
