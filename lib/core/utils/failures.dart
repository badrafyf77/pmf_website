import 'package:firebase_core/firebase_core.dart';

abstract class Failure {
  final String errMessage;

  Failure({
    required this.errMessage,
  });
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
