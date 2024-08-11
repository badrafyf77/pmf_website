import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pmf_website/core/utils/customs/mouse_follower.dart';
import 'package:pmf_website/features/cups/presentation/views/cup_table_view.dart';
import 'package:pmf_website/features/cups/presentation/views/cups_view.dart';
import 'package:pmf_website/features/leagues/presentation/views/league_matches_view.dart';
import 'package:pmf_website/features/leagues/presentation/views/league_table_view.dart';
import 'package:pmf_website/features/leagues/presentation/views/leagues_view.dart';
import 'package:pmf_website/features/profile/presentation/views/profile_view.dart';
import 'package:pmf_website/features/trophies/presentation/views/trophies_view.dart';

class AppRouter {
  static const profile = '/';
  static const leagues = '/leagues';
  static const leagueTable = '/leagueTable';
  static const leagueMatches = '/leagueMatches';
  static const cups = '/cups';
  static const cupTable = '/cupTable';
  static const trophies = '/trophies';

  static final router = GoRouter(
    routes: [
      GoRoute(
          path: profile,
          pageBuilder: (context, state) {
            if (kIsWeb) {
              // MetaSEO meta = MetaSEO();
              // meta.ogTitle(ogTitle: 'Events Week');
              // meta.description(description: 'Association Events Week');
              // meta.keywords(
              //     keywords: 'Evenements, Events Week, AEW, Rabat, Maroc');
            }
            return const NoTransitionPage(
              child: MouseFollowerWidget(
                child: ProfileView(),
              ),
            );
          }),
      GoRoute(
        path: leagues,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: MouseFollowerWidget(
            child: LeaguesView(),
          ),
        ),
      ),
      GoRoute(
        path: leagueTable,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: MouseFollowerWidget(
            child: LeagueTableView(),
          ),
        ),
      ),
      GoRoute(
        path: leagueMatches,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: MouseFollowerWidget(
            child: LeagueMatchesView(),
          ),
        ),
      ),
      GoRoute(
        path: cups,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: MouseFollowerWidget(
            child: CupsView(),
          ),
        ),
      ),
      GoRoute(
        path: trophies,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: MouseFollowerWidget(
            child: TrophiesView(),
          ),
        ),
      ),
      GoRoute(
        path: cupTable,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: MouseFollowerWidget(
            child: CupTableView(),
          ),
        ),
      ),
      // GoRoute(
      //   name: eventInfo,
      //   path: '$eventInfo/:id',
      //   pageBuilder: (context, state) {
      //     final id = state.pathParameters['id']!;
      //     return NoTransitionPage(
      //       child: MouseFollowerWidget(
      //         child: EventInfoView(
      //           id: id,
      //         ),
      //       ),
      //     );
      //   },
      // ),
    ],
  );
  static void navigateTo(BuildContext context, String path) {
    context.go(
      path,
    );
  }

  static void navigateToWithUrlParametre(
      BuildContext context, String name, String id, String value) {
    context.goNamed(name, pathParameters: {id: value});
  }
}
