import 'package:get_it/get_it.dart';
import 'package:pmf_website/core/services/auth_service.dart';
import 'package:pmf_website/core/services/firestore_service.dart';
import 'package:pmf_website/features/auth/data/repo/auth_repo_implementation.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<AuthService>(
    AuthService(),
  );
  getIt.registerSingleton<FirestoreService>(
    FirestoreService(),
  );
  getIt.registerSingleton<AuthRepoImplement>(
    AuthRepoImplement(
      getIt.get<AuthService>(),
      getIt.get<FirestoreService>(),
    ),
  );
}
