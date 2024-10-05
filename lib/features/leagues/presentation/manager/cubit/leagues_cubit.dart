import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pmf_website/core/models/fixture_model.dart';
import 'package:pmf_website/core/models/player_model.dart';
import 'package:pmf_website/core/services/firestore_service.dart';
import 'package:pmf_website/features/leagues/data/models/league_model.dart';
import 'package:pmf_website/features/leagues/data/repo/league_repo.dart';

part 'leagues_state.dart';

class LeaguesCubit extends Cubit<LeaguesState> {
  final LeaguesRepo _leaguesRepo;
  LeaguesCubit(this._leaguesRepo) : super(LeaguesInitial());

  Future<void> getLeague(String leagueId) async {
    var result = await _leaguesRepo.getLeague(leagueId);
    result.fold((left) {}, (right) {
      emit(GetLeagueSuccess(league: right));
    });
  }

  Future<void> getLeagues() async {
    emit(Leagueslaoding());
    var result = await _leaguesRepo.getLeagues();
    result.fold((left) {
      emit(LeaguesFailure(err: left.errMessage));
    }, (right) {
      emit(GetLeaguesSuccess(leaguesList: right));
    });
  }

  Future<void> getPlayers(String leagueId) async {
    emit(Leagueslaoding());
    var result = await _leaguesRepo.getPlayers(leagueId);
    result.fold((left) {
      emit(LeaguesFailure(err: left.errMessage));
    }, (right) {
      emit(GetPlayersSuccess(playersList: right));
    });
  }

  Future<void> getMatches(String leagueId, {int? round}) async {
    emit(Leagueslaoding());
    dynamic result;
    if (round == null) {
      League league = await FirestoreService().getLeague(leagueId);
      result = await _leaguesRepo.getMatches(leagueId, league.currentRound);
    } else {
      result = await _leaguesRepo.getMatches(leagueId, round);
    }
    result.fold((left) {
      emit(LeaguesFailure(err: left.errMessage));
    }, (right) {
      emit(GetMatchesSuccess(fixtures: right));
    });
  }
}
