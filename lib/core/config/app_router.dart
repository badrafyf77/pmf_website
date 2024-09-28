import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:meta_seo/meta_seo.dart';
import 'package:pmf_website/core/utils/customs/mouse_follower.dart';
import 'package:pmf_website/core/utils/service_locator.dart';
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
import 'package:pmf_website/features/settings/data/repo/settings_repo_implementation.dart';
import 'package:pmf_website/features/settings/presentation/manager/cubit/settings_cubit.dart';
import 'package:pmf_website/features/settings/presentation/views/settings_view.dart';

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
  static const settings = '/settings';

  static final router = GoRouter(
    routes: [
      GoRoute(
          path: home,
          pageBuilder: (context, state) {
            if (kIsWeb) {
              MetaSEO meta = MetaSEO();
              meta.ogTitle(ogTitle: 'PES MOROCCAN FAMILY');
              meta.description(description: 'PES MOROCCAN FAMILY');
              meta.keywords(
                  keywords:
                      'pesmoroccanfamily, pmf, pes, efootball maroc, efootball, pes moroccan family');
            }
            return const NoTransitionPage(
              child: MouseFollowerWidget(
                child: HomeView(),
              ),
            );
          }),
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
        name: leagues,
        path: '$leagues/:id',
        pageBuilder: (context, state) {
          final id = state.pathParameters['id']!;
          return NoTransitionPage(
            child: MouseFollowerWidget(
              child: LeaguesView(
                id: id,
              ),
            ),
          );
        },
      ),
      GoRoute(
        name: leagueTable,
        path: '$leagueTable/:id/:league',
        pageBuilder: (context, state) {
          final id = state.pathParameters['id']!;
          final leagueId = state.pathParameters['league']!;
          return NoTransitionPage(
            child: MouseFollowerWidget(
              child: LeagueTableView(
                id: id,
                leagueId: leagueId,
              ),
            ),
          );
        },
      ),
      GoRoute(
        name: leagueMatches,
        path: '$leagueMatches/:id/:league',
        pageBuilder: (context, state) {
          final id = state.pathParameters['id']!;
          final leagueId = state.pathParameters['league']!;
          return NoTransitionPage(
            child: MouseFollowerWidget(
              child: LeagueMatchesView(
                id: id,
                leagueId: leagueId,
              ),
            ),
          );
        },
      ),
      GoRoute(
        name: cups,
        path: '$cups/:id',
        pageBuilder: (context, state) {
          final id = state.pathParameters['id']!;
          return NoTransitionPage(
            child: MouseFollowerWidget(
              child: CupsView(
                id: id,
              ),
            ),
          );
        },
      ),
      GoRoute(
        name: cupTable,
        path: '$cupTable/:id',
        pageBuilder: (context, state) {
          final id = state.pathParameters['id']!;
          return NoTransitionPage(
            child: MouseFollowerWidget(
              child: CupTableView(
                id: id,
              ),
            ),
          );
        },
      ),
      GoRoute(
        name: cupGroupsMatches,
        path: '$cupGroupsMatches/:id',
        pageBuilder: (context, state) {
          final id = state.pathParameters['id']!;
          return NoTransitionPage(
            child: MouseFollowerWidget(
              child: CupGroupsMatchesView(
                id: id,
              ),
            ),
          );
        },
      ),
      GoRoute(
        name: cupKnockoutStage,
        path: '$cupKnockoutStage/:id',
        pageBuilder: (context, state) {
          final id = state.pathParameters['id']!;
          return NoTransitionPage(
            child: MouseFollowerWidget(
              child: CupKnockoutView(
                id: id,
              ),
            ),
          );
        },
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
        name: settings,
        path: '$settings/:id',
        pageBuilder: (context, state) {
          final id = state.pathParameters['id']!;
          return NoTransitionPage(
            child: MouseFollowerWidget(
              child: BlocProvider(
                create: (context) => SettingsCubit(
                  getIt.get<SettingsRepoImplementation>(),
                )..getUser(id),
                child: SettingsView(
                  id: id,
                ),
              ),
            ),
          );
        },
      ),
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

  static void navigateToWithTwoUrlParametres(BuildContext context, String path,
      String name1, String value1, String name2, String value2) {
    context.goNamed(path, pathParameters: {name1: value1, name2: value2});
  }
}
