import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pmf_website/core/utils/customs/mouse_follower.dart';
import 'package:pmf_website/features/leagues/presentation/views/league_info_view.dart';
import 'package:pmf_website/features/leagues/presentation/views/leagues_view.dart';
import 'package:pmf_website/features/profile/presentation/views/profile_view.dart';

class AppRouter {
  static const profile = '/';
  static const leagues = '/leagues';
  static const leagueInfo = '/leagueInfo';

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
        path: leagueInfo,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: MouseFollowerWidget(
            child: LeagueInfoView(),
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
