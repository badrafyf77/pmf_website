import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pmf_website/core/models/user_info_model.dart';
import 'package:pmf_website/features/auth/data/repo/auth_repo.dart';
import 'package:uuid/uuid.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepo _authRepo;
  AuthBloc(
    this._authRepo,
  ) : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is SignUpEvent) {
        emit(AuthLoading());
        String id = const Uuid().v4();
        UserInformation userInfo = UserInformation(
          id: id,
          displayName: event.displayName,
          email: event.email,
          joinedDate: Timestamp.now(),
          leagueRanking: 0,
          played: 0,
          wins: 0,
          draws: 0,
          losses: 0,
          participations: [],
        );
        var user = await _authRepo.signUp(userInfo,event.password);
        user.fold((failure) {
          emit(AuthFailure(errorMessage: failure.errMessage));
        }, (userCredential) {
          emit(AuthSuccess());
        });
      }

      if (event is SignInEvent) {
        emit(AuthLoading());
        var user = await _authRepo.signIn(event.email, event.password);
        user.fold((failure) {
          emit(AuthFailure(errorMessage: failure.errMessage));
        }, (user) {
          emit(SignInSuccess(id: user.id));
        });
      }

      if (event is ForgotPassEvent) {
        emit(AuthLoading());
        var data = await _authRepo.forgotPass(event.email);
        data.fold((failure) {
          emit(AuthFailure(errorMessage: failure.errMessage));
        }, (noError) {
          emit(AuthSuccess());
        });
      }
    });
  }
}
