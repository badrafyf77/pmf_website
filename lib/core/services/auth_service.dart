import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final _auth = FirebaseAuth.instance;
  // final _firestoreService = FirestoreService();

  Future<User> signUp(String email, String password) async {
    final credential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return credential.user!;
  }

  Future<User> signIn(String email, String password) async {
    final credential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return credential.user!;
  }

  Future<void> sendPasswordReset(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  // Future<void> updateEmail(String password, String newEmail) async {
  //   String email = _auth.currentUser!.email!;
  //   await reAuthentification(email, password);
  //   UserInformation user = await _firestoreService.getUser(email);
  //   await _auth.currentUser!.verifyBeforeUpdateEmail(newEmail);
  //   await _firestoreService.deleteUser(email);
  //   user.email = newEmail;
  //   await _firestoreService.addUser(user);
  // }

  // Future<void> updatePassword(String oldPassword, String newPassword) async {
  //   await reAuthentification(_auth.currentUser!.email!, oldPassword);
  //   await _auth.currentUser!.updatePassword(newPassword);
  // }

  // Future<bool> checkPassword(String password) async {
  //   var user = await _firestoreService.getUser(_auth.currentUser!.email!);
  //   return user.password == password;
  // }

  // Future<void> reAuthentification(String email, String password) async {
  //   await _auth.currentUser?.reauthenticateWithCredential(
  //     EmailAuthProvider.credential(
  //       email: email,
  //       password: password,
  //     ),
  //   );
  // }
}
