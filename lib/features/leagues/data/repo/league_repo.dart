import 'package:dartz/dartz.dart';
import 'package:pmf_website/core/models/fixture_model.dart';
import 'package:pmf_website/core/models/player_model.dart';
import 'package:pmf_website/core/utils/failures.dart';
import 'package:pmf_website/features/leagues/data/models/league_model.dart';

abstract class LeaguesRepo {
  Future<Either<Failure, List<League>>> getLeagues();
  Future<Either<Failure, List<Player>>> getPlayers(League league);
  Future<Either<Failure, List<Fixture>>> getMatches(League league, int round);
}
