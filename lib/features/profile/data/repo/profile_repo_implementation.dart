import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pmf_website/core/models/user_info_model.dart';
import 'package:pmf_website/core/services/firestore_service.dart';
import 'package:pmf_website/core/utils/failures.dart';
import 'package:pmf_website/features/profile/data/repo/profile_repo.dart';

class ProfileRepoImplementation implements ProfileRepo {
  final FirestoreService _firestoreService;

  ProfileRepoImplementation(
    this._firestoreService,
  );

  @override
  Future<Either<Failure, UserInformation>> getUser(
      String id) async {
    try {
      UserInformation userInformation = await _firestoreService.getUser(id);
      return right(userInformation);
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

  
}
