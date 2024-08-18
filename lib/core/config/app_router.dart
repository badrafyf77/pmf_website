import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pmf_website/core/utils/customs/mouse_follower.dart';
import 'package:pmf_website/features/auth/presentation/views/sign_in_view.dart';
import 'package:pmf_website/features/auth/presentation/views/sign_up_view.dart';
import 'package:pmf_website/features/cups/presentation/views/cup_groups_matches_view.dart';
import 'package:pmf_website/features/cups/presentation/views/cup_knockout_view.dart';
import 'package:pmf_website/features/cups/presentation/views/cup_table_view.dart';
import 'package:pmf_website/features/cups/presentation/views/cups_view.dart';
import 'package:pmf_website/features/home/presentation/views/home_view.dart';
import 'package:pmf_website/features/leagues/presentation/views/league_matches_view.dart';
import 'package:pmf_website/features/leagues/presentation/views/league_table_view.dart';
import 'package:pmf_website/features/leagues/presentation/views/leagues_view.dart';
import 'package:pmf_website/features/profile/presentation/views/profile_view.dart';
import 'package:pmf_website/features/home/presentation/views/trophies_view.dart';

class AppRouter {
  static const home = '/';
  static const trophies = '/trophies';
  static const signIn = '/sign-in';
  static const signUp = '/sign-up';
  static const profile = '/profile';
  static const leagues = '/leagues';
  static const leagueTable = '/league-table';
  static const leagueMatches = '/league-matches';
  static const cups = '/cups';
  static const cupTable = '/cup-table';
  static const cupGroupsMatches = '/cup-groups-matches';
  static const cupKnockoutStage = '/cup-knockout-stage';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: home,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: MouseFollowerWidget(
            child: HomeView(),
          ),
        ),
      ),
      GoRoute(
        path: signIn,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: MouseFollowerWidget(
            child: SignInView(),
          ),
        ),
      ),
      GoRoute(
        path: signUp,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: MouseFollowerWidget(
            child: SignUpView(),
          ),
        ),
      ),
      GoRoute(
        name: profile,
        path: '$profile/:id',
        pageBuilder: (context, state) {
          final id = state.pathParameters['id']!;
          return NoTransitionPage(
            child: MouseFollowerWidget(
              child: ProfileView(
                id: id,
              ),
            ),
          );
        },
      ),
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
        path: cupTable,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: MouseFollowerWidget(
            child: CupTableView(),
          ),
        ),
      ),
      GoRoute(
        path: cupGroupsMatches,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: MouseFollowerWidget(
            child: CupGroupsMatchesView(),
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
        path: cupKnockoutStage,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: MouseFollowerWidget(
            child: CupKnockoutView(),
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
      BuildContext context, String path, String name, String value) {
    context.goNamed(path, pathParameters: {name: value});
  }
}
