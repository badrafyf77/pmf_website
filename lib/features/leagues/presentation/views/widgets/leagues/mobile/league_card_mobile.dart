import 'package:flutter/material.dart';
import 'package:pmf_website/core/utils/customs/image_network.dart';
import 'package:pmf_website/core/utils/customs/pmf_background.dart';
import 'package:pmf_website/features/leagues/data/models/league_model.dart';
import 'package:pmf_website/features/leagues/presentation/views/widgets/leagues/mobile/league_prizes_mobile.dart';

class LeagueCardMobile extends StatelessWidget {
  const LeagueCardMobile({super.key, required this.id, required this.league});

  final String id;
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
                const SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomImageNetwork(
                          url: league.downloadUrl,
                          height: 120,
                          width: 120,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 15),
                LeagueInfoMobile(
                  id: id,
                  league: league,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
