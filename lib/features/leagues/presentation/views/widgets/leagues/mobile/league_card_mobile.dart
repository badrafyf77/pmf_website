import 'package:flutter/material.dart';
import 'package:pmf_website/core/utils/customs/logo.dart';
import 'package:pmf_website/core/utils/customs/pmf_background.dart';
import 'package:pmf_website/features/leagues/presentation/views/widgets/leagues/mobile/league_info_mobile.dart';
import 'package:pmf_website/features/leagues/presentation/views/widgets/leagues/mobile/league_prizes_mobile.dart';

class LeagueCardMobile extends StatelessWidget {
  const LeagueCardMobile({super.key, required this.id});

  final String id;

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
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: AppLogo(),
                      ),
                    ),
                    const SizedBox(height: 8),
                    LeagueInfoMobile(
                      id: id,
                    ),
                  ],
                ),
                const SizedBox(width: 15),
                const LeaguePrizesMobile(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
