import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pmf_website/core/models/user_model.dart';
import 'package:pmf_website/core/services/auth_service.dart';
import 'package:pmf_website/core/services/firestore_service.dart';
import 'package:pmf_website/core/utils/failures.dart';
import 'package:pmf_website/features/settings/data/repo/settings_repo.dart';

class SettingsRepoImplementation implements SettingsRepo {
  final AuthService _authService;
  final FirestoreService _firestoreService;

  SettingsRepoImplementation(
    this._authService,
    this._firestoreService,
  );

  @override
  Future<Either<Failure, UserInformation>> getUser(String id) async {
    try {
      UserInformation userInformation = await _firestoreService.getUser(id);
      return right(userInformation);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return left(FirebaseAuthFailure.fromFirebaseAuthException(e));
      }
      return left(
        FirestoreFailure(errMessage: 'il y a une erreur, veuillez réessayer'),
      );
    }
  }

  @override
  Future<Either<Failure, UserInformation>> changeEmail(
      UserInformation user, String newEmail) async {
    try {
      await _authService.updateEmail(user, newEmail);
      await _firestoreService.updateEmail(user.id, newEmail);
      final u = await _firestoreService.getUser(user.id);
      return right(u);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return left(FirebaseAuthFailure.fromFirebaseAuthException(e));
      }
      return left(
        FirestoreFailure(errMessage: 'il y a une erreur, veuillez réessayer'),
      );
    }
  }

  @override
  Future<Either<Failure, UserInformation>> changeName(
      UserInformation user, String newName) async {
    try {
      await _firestoreService.updateName(user.id, newName);
      final u = await _firestoreService.getUser(user.id);
      return right(u);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return left(FirebaseAuthFailure.fromFirebaseAuthException(e));
      }
      return left(
        FirestoreFailure(errMessage: 'il y a une erreur, veuillez réessayer'),
      );
    }
  }

  @override
  Future<Either<Failure, UserInformation>> changePass(
      UserInformation user, String newPass) async {
    try {
      await _authService.updatePassword(user, newPass);
      await _firestoreService.updatePassword(user.id, newPass);
      final u = await _firestoreService.getUser(user.id);
      return right(u);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return left(FirebaseAuthFailure.fromFirebaseAuthException(e));
      }
      return left(
        FirestoreFailure(errMessage: 'il y a une erreur, veuillez réessayer'),
      );
    }
  }

  @override
  Future<Either<Failure, Unit>> sendResetPass(UserInformation user) async {
    try {
      await _authService.sendPasswordReset(user.email);
      return right(unit);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return left(FirebaseAuthFailure.fromFirebaseAuthException(e));
      }
      return left(
        FirestoreFailure(errMessage: 'il y a une erreur, veuillez réessayer'),
      );
    }
  }
}
