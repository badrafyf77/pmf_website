import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pmf_website/core/models/user_info_model.dart';
import 'package:pmf_website/features/settings/data/repo/settings_repo.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final SettingsRepo _settingsRepo;
  SettingsCubit(this._settingsRepo) : super(SettingsInitial());

  Future<void> getUser(String id) async {
    emit(SettingsLaoding());
    var result = await _settingsRepo.getUser(id);
    result.fold(
      (left) {
        emit(SettingsFailure(err: left.errMessage));
      },
      (right) {
        emit(GetUserSuccess(userInformation: right));
      },
    );
  }

  Future<void> changeName(UserInformation user, String newName) async {
    emit(SettingsLaoding());
    var result = await _settingsRepo.changeName(user, newName);
    result.fold(
      (left) {
        emit(SettingsFailure(err: left.errMessage));
      },
      (right) {
        emit(ChangeNameSuccess(userInformation: right));
      },
    );
  }

  Future<void> changePass(UserInformation user, String newPass) async {
    emit(SettingsLaoding());
    var result = await _settingsRepo.changePass(user, newPass);
    result.fold(
      (left) {
        emit(SettingsFailure(err: left.errMessage));
      },
      (right) {
        emit(ChangePassSuccess(userInformation: right));
      },
    );
  }

  Future<void> changeEmail(UserInformation user, String newEmail) async {
    emit(SettingsLaoding());
    var result = await _settingsRepo.changeEmail(user, newEmail);
    result.fold(
      (left) {
        emit(SettingsFailure(err: left.errMessage));
      },
      (right) {
        emit(ChangeEmailSuccess(userInformation: right));
      },
    );
  }

  Future<void> sendPasswordReset(UserInformation user) async {
    emit(SettingsLaoding());
    var result = await _settingsRepo.sendResetPass(user);
    result.fold(
      (left) {
        emit(SettingsFailure(err: left.errMessage));
      },
      (right) {
        emit(SendPasswordResetSuccess());
      },
    );
  }
}
