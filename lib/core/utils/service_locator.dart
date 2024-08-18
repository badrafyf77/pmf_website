import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:pmf_website/core/models/user_model.dart';
import 'package:pmf_website/core/services/auth_service.dart';
import 'package:pmf_website/core/services/firestore_service.dart';
import 'package:pmf_website/features/auth/data/repo/auth_repo_implementation.dart';
import 'package:pmf_website/features/profile/data/repo/profile_repo_implementation.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<AuthService>(
    AuthService(),
  );
  getIt.registerSingleton<FirestoreService>(
    FirestoreService(),
  );
  getIt.registerSingleton<UserInformation>(
    UserInformation(
      id: 'id',
      displayName: 'displayName',
      email: 'email',
      password: 'password',
      joinedDate: Timestamp.now(),
      leagueRanking: 0,
      played: 200,
      wins: 100,
      draws: 50,
      losses: 50,
    ),
  );

  getIt.registerSingleton<AuthRepoImplement>(
    AuthRepoImplement(
      getIt.get<AuthService>(),
      getIt.get<FirestoreService>(),
    ),
  );
  getIt.registerSingleton<ProfileRepoImplementation>(
    ProfileRepoImplementation(
      getIt.get<FirestoreService>(),
    ),
  );
}
