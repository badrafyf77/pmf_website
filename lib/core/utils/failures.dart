import 'package:firebase_auth/firebase_auth.dart';

abstract class Failure {
  final String errMessage;

  Failure({
    required this.errMessage,
  });
}

class FirebaseAuthFailure extends Failure {
  FirebaseAuthFailure({required super.errMessage});

  factory FirebaseAuthFailure.fromFirebaseAuthException(
      FirebaseAuthException e) {
    switch (e.code) {
      case 'weak-password':
        {
          return FirebaseAuthFailure(errMessage: 'Weak password');
        }
      case 'email-already-in-use':
        {
          return FirebaseAuthFailure(errMessage: 'Email already in use');
        }
      case 'user-not-found':
        {
          return FirebaseAuthFailure(errMessage: 'User not found');
        }
      case 'wrong-password':
        {
          return FirebaseAuthFailure(errMessage: 'Incorrect password');
        }
      default:
        return FirebaseAuthFailure(errMessage: e.code);
    }
  }
}

class FirestoreFailure extends Failure {
  FirestoreFailure({required super.errMessage});

  factory FirestoreFailure.fromFirestoreFailure(FirebaseException e) {
    switch (e.code) {
      case '':
        {
          return FirestoreFailure(errMessage: 'erreur message');
        }
      default:
        return FirestoreFailure(errMessage: e.code);
    }
  }
}

class FirestorageFailure extends Failure {
  FirestorageFailure({required super.errMessage});

  factory FirestorageFailure.fromFirestoreFailure(FirebaseException e) {
    switch (e.code) {
      case '':
        {
          return FirestorageFailure(errMessage: 'erreur message');
        }
      default:
        return FirestorageFailure(errMessage: e.code);
    }
  }
}

class PickImageFailure extends Failure {
  PickImageFailure({required super.errMessage});
}
