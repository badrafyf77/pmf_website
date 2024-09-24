import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pmf_website/core/models/fixture_model.dart';
import 'package:pmf_website/core/models/player_model.dart';
import 'package:pmf_website/features/leagues/data/models/league_model.dart';
import 'package:pmf_website/features/leagues/data/repo/league_repo.dart';

part 'leagues_state.dart';

class LeaguesCubit extends Cubit<LeaguesState> {
  final LeaguesRepo _leaguesRepo;
  LeaguesCubit(this._leaguesRepo) : super(LeaguesInitial());


  Future<void> getLeagues() async {
    emit(Leagueslaoding());
    var result = await _leaguesRepo.getLeagues();
    result.fold((left) {
      emit(LeaguesFailure(err: left.errMessage));
    }, (right) {
      emit(GetLeaguesSuccess(leaguesList: right));
    });
  }

  Future<void> getPlayers(League league) async {
    emit(Leagueslaoding());
    var result = await _leaguesRepo.getPlayers(league);
    result.fold((left) {
      emit(LeaguesFailure(err: left.errMessage));
    }, (right) {
      emit(GetPlayersSuccess(playersList: right));
    });
  }

  Future<void> getMatches(League league, int round) async {
    emit(Leagueslaoding());
    var result = await _leaguesRepo.getMatches(league, round);
    result.fold((left) {
      emit(LeaguesFailure(err: left.errMessage));
    }, (right) {
      emit(GetMatchesSuccess(fixtures: right));
    });
  }
}