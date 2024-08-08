import 'package:get_it/get_it.dart';
import 'package:pmf_website/core/services/firestore_service.dart';
import 'package:pmf_website/features/profile/data/repo/home_repo_implementation.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<FirestoreService>(
    FirestoreService(),
  );
  getIt.registerSingleton<HomeRepoImplementation>(
    HomeRepoImplementation(
      getIt.get<FirestoreService>(),
    ),
  );
}
