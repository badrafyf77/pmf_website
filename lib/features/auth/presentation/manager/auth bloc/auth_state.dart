part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthSuccess extends AuthState {}

final class AuthFailure extends AuthState {
  final String errorMessage;

  AuthFailure({
    required this.errorMessage,
  });
}

final class SignInSuccess extends AuthState {
  final String id;

  SignInSuccess({required this.id});
}
