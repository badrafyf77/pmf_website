import 'package:dartz/dartz.dart';
import 'package:pmf_website/core/models/user_info_model.dart';
import 'package:pmf_website/core/utils/failures.dart';

abstract class SettingsRepo {
  Future<Either<Failure, UserInformation>> getUser(String id);
  Future<Either<Failure, UserInformation>> changeName(UserInformation user, String password, String newName);
  Future<Either<Failure, UserInformation>> changeEmail(UserInformation user, String password, String newEmail);
  Future<Either<Failure, UserInformation>> changePass(UserInformation user, String password, String newPass);
  Future<Either<Failure, Unit>> sendResetPass(UserInformation user);
}
