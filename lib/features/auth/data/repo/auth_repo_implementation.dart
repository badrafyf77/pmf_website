import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pmf_website/core/models/user_model.dart';
import 'package:pmf_website/core/services/auth_service.dart';
import 'package:pmf_website/core/services/firestore_service.dart';
import 'package:pmf_website/core/utils/failures.dart';
import 'package:pmf_website/features/auth/data/repo/auth_repo.dart';

class AuthRepoImplement implements AuthRepo {
  final AuthService _authService;
  final FirestoreService _firestoreService;

  AuthRepoImplement(
    this._authService,
    this._firestoreService,
  );

  @override
  Future<Either<Failure, User>> signUp(
      UserInformation userInfo) async {
    try {
      await _firestoreService.addUser(userInfo);
      User user = await _authService.signUp(userInfo.email, userInfo.password);
      return right(user);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return left(FirebaseAuthFailure.fromFirebaseAuthException(e));
      }
      return left(
        FirestoreFailure(
            errMessage: 'il y a une erreur, veuillez réessayer'),
      );
    }
  }

  @override
  Future<Either<Failure, UserInformation>> signIn(String email, String password) async {
    try {
      await _authService.signIn(email, password);
      UserInformation userInformation = await _firestoreService.getUserByEmail(email);
      return right(userInformation);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return left(FirebaseAuthFailure.fromFirebaseAuthException(e));
      }
      return left(FirebaseAuthFailure(
          errMessage: 'il y a une erreur, veuillez réessayer'));
    }
  }

  @override
  Future<Either<Failure, bool>> forgotPass(String email) async {
    try {
      await _authService.sendPasswordReset(email);
      return right(false);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return left(FirebaseAuthFailure.fromFirebaseAuthException(e));
      }
      return left(FirebaseAuthFailure(
          errMessage: 'il y a une erreur, veuillez réessayer'));
    }
  }
}
