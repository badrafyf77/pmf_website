part of 'settings_cubit.dart';

sealed class SettingsState {}

final class SettingsInitial extends SettingsState {}

final class SettingsLaoding extends SettingsState {}

final class SendPasswordResetSuccess extends SettingsState {}

final class SettingsFailure extends SettingsState {
  final String err;

  SettingsFailure({required this.err});
}

final class GetUserSuccess extends SettingsState {
  final UserInformation userInformation;

  GetUserSuccess({required this.userInformation});
}

final class ChangePassSuccess extends SettingsState {
  final UserInformation userInformation;

  ChangePassSuccess({required this.userInformation});
}

final class ChangeNameSuccess extends SettingsState {
  final UserInformation userInformation;

  ChangeNameSuccess({required this.userInformation});
}

final class ChangeEmailSuccess extends SettingsState {
  final UserInformation userInformation;

  ChangeEmailSuccess({required this.userInformation});
}
