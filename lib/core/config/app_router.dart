import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:meta_seo/meta_seo.dart';
import 'package:pmf_website/core/utils/customs/mouse_follower.dart';
import 'package:pmf_website/core/utils/service_locator.dart';
import 'package:pmf_website/features/auth/presentation/views/forgot_pass_view.dart';
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
  static const forgotPass = '/forgot-password';
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
        path: forgotPass,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: MouseFollowerWidget(
            child: ForgotPassView(),
          ),
        ),
      ),
      GoRoute(
        name: profile,
        path: profile,
        pageBuilder: (context, state) {
          return const NoTransitionPage(
            child: MouseFollowerWidget(
              child: ProfileView(),
            ),
          );
        },
      ),
      GoRoute(
        name: leagues,
        path: leagues,
        pageBuilder: (context, state) {
          return const NoTransitionPage(
            child: MouseFollowerWidget(
              child: LeaguesView(),
            ),
          );
        },
      ),
      GoRoute(
        name: leagueTable,
        path: '$leagueTable/:league',
        pageBuilder: (context, state) {
          final leagueId = state.pathParameters['league']!;
          return NoTransitionPage(
            child: MouseFollowerWidget(
              child: LeagueTableView(
                leagueId: leagueId,
              ),
            ),
          );
        },
      ),
      GoRoute(
        name: leagueMatches,
        path: '$leagueMatches/:league',
        pageBuilder: (context, state) {
          final leagueId = state.pathParameters['league']!;
          return NoTransitionPage(
            child: MouseFollowerWidget(
              child: LeagueMatchesView(
                leagueId: leagueId,
              ),
            ),
          );
        },
      ),
      GoRoute(
        name: cups,
        path: cups,
        pageBuilder: (context, state) {
          return const NoTransitionPage(
            child: MouseFollowerWidget(
              child: CupsView(),
            ),
          );
        },
      ),
      GoRoute(
        name: cupTable,
        path: cupTable,
        pageBuilder: (context, state) {
          return const NoTransitionPage(
            child: MouseFollowerWidget(
              child: CupTableView(),
            ),
          );
        },
      ),
      GoRoute(
        name: cupGroupsMatches,
        path: cupGroupsMatches,
        pageBuilder: (context, state) {
          return const NoTransitionPage(
            child: MouseFollowerWidget(
              child: CupGroupsMatchesView(),
            ),
          );
        },
      ),
      GoRoute(
        name: cupKnockoutStage,
        path: cupKnockoutStage,
        pageBuilder: (context, state) {
          return const NoTransitionPage(
            child: MouseFollowerWidget(
              child: CupKnockoutView(),
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
        path: settings,
        pageBuilder: (context, state) {
          return NoTransitionPage(
            child: MouseFollowerWidget(
              child: BlocProvider(
                create: (context) {
                  return SettingsCubit(
                    getIt.get<SettingsRepoImplementation>(),
                  );
                },
                child: const SettingsView(),
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
