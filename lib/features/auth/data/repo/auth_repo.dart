import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pmf_website/core/models/user_info_model.dart';
import 'package:pmf_website/core/utils/failures.dart';

abstract class AuthRepo {
  Future<Either<Failure, User>> signUp(UserInformation userInfo);
  Future<Either<Failure, UserInformation>> signIn(String email, String password);
  Future<Either<Failure, bool>> forgotPass(String email);
}
