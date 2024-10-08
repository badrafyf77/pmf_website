import 'package:dartz/dartz.dart';
import 'package:pmf_website/core/models/fixture_model.dart';
import 'package:pmf_website/core/models/player_model.dart';
import 'package:pmf_website/core/utils/failures.dart';
import 'package:pmf_website/features/leagues/data/models/league_model.dart';

abstract class LeaguesRepo {
  Future<Either<Failure, List<League>>> getLeagues();
  Future<Either<Failure, League>> getLeague(String leagueId);
  Future<Either<Failure, List<Player>>> getPlayers(String leagueId);
  Future<Either<Failure, List<Fixture>>> getMatches(String leagueId, int round);
}
