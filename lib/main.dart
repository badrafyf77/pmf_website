import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta_seo/meta_seo.dart';
import 'package:pmf_website/core/config/app_router.dart';
import 'package:pmf_website/core/config/theme.dart';
import 'package:pmf_website/core/utils/service_locator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pmf_website/features/auth/data/repo/auth_repo_implementation.dart';
import 'package:pmf_website/features/auth/presentation/manager/auth%20bloc/auth_bloc.dart';
import 'package:pmf_website/features/leagues/data/repo/league_repo_implementation.dart';
import 'package:pmf_website/features/leagues/presentation/manager/cubit/leagues_cubit.dart';
import 'package:pmf_website/features/news/data/repo/posts_repo_implementation.dart';
import 'package:pmf_website/features/news/presentation/manager/cubit/posts_cubit.dart';
import 'package:pmf_website/features/profile/data/repo/profile_repo_implementation.dart';
import 'package:pmf_website/features/profile/presentation/manager/get%20user%20info%20cubit/get_user_info_cubit.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  if (kIsWeb) {
    MetaSEO().config();
  }
  runApp(const MyApp());
  setupServiceLocator();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => AuthBloc(
            getIt.get<AuthRepoImplement>(),
          ),
        ),
        BlocProvider(
          create: (BuildContext context) => GetUserInfoCubit(
            getIt.get<ProfileRepoImplementation>(),
          ),
        ),
        BlocProvider(
          create: (BuildContext context) => LeaguesCubit(
            getIt.get<LeaguesRepoImplementation>(),
          ),
        ),
        BlocProvider(
          create: (BuildContext context) => PostsCubit(
            getIt.get<PostsRepoImplementation>(),
          ),
        ),
      ],
      child: MaterialApp.router(
        title: 'PES MOROCCAN FAMILY',
        debugShowCheckedModeBanner: false,
        theme: AppThemes.appTheme,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
