import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:pmf_website/core/models/fixture_model.dart';
import 'package:pmf_website/core/models/player_model.dart';
import 'package:pmf_website/core/services/firestore_service.dart';
import 'package:pmf_website/core/utils/failures.dart';
import 'package:pmf_website/features/leagues/data/models/league_model.dart';
import 'package:pmf_website/features/leagues/data/repo/league_repo.dart';

class LeaguesRepoImplementation implements LeaguesRepo {
  final FirestoreService _firestoreService;

  LeaguesRepoImplementation(this._firestoreService);

  @override
  Future<Either<Failure, List<League>>> getLeagues() async {
    try {
      List<League> leaguesList = await _firestoreService.getLeagues();
      return right(leaguesList);
    } catch (e) {
      if (e is FirebaseException) {
        return left(FirestoreFailure.fromFirestoreFailure(e));
      }
      return left(FirestoreFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Player>>> getPlayers(League league) async {
    try {
      var playersList = await _firestoreService.getPlayers(league);
      return right(playersList);
    } catch (e) {
      if (e is FirebaseException) {
        return left(FirestoreFailure.fromFirestoreFailure(e));
      }
      return left(FirestoreFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Fixture>>> getMatches(
      League league, int round) async {
    try {
      List<Fixture> fixtures =
          await _firestoreService.getMatches(league, round);
      return right(fixtures);
    } catch (e) {
      if (e is FirebaseException) {
        return left(FirestoreFailure.fromFirestoreFailure(e));
      }
      return left(FirestoreFailure(errMessage: e.toString()));
    }
  }
}
