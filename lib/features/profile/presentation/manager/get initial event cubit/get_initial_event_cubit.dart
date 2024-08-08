import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pmf_website/core/models/event_model.dart';
import 'package:pmf_website/features/profile/data/repo/home_repo.dart';

part 'get_initial_event_state.dart';

class GetInitialEventCubit extends Cubit<GetInitialEventState> {
  final HomeRepo _homeRepo;
  GetInitialEventCubit(this._homeRepo) : super(GetInitialEventInitial());

  Future<void> getInitialEvent() async {
    emit(GetInitialEventLoading());
    var result = await _homeRepo.getInitialEvent();
    result.fold((left) {
      emit(GetInitialEventFailure(err: left.errMessage));
    }, (right) {
      emit(GetInitialEventSuccess(event: right));
    });
  }
}
