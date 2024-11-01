import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final _auth = FirebaseAuth.instance;

  Future<User> signUp(String email, String password) async {
    final credential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return credential.user!;
  }

  Future<User> signIn(String email, String password) async {
    final credential = await _auth.signInWithEmailAndPassword(
      email: email.toLowerCase(),
      password: password,
    );
    return credential.user!;
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  Future<void> sendPasswordReset(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  Future<void> updateEmail(
      String email, String password, String newEmail) async {
    await reAuthentification(email, password);
    await _auth.currentUser!.delete();

    await signUp(newEmail, password);
  }

  Future<void> updatePassword(
      String email, String password, String newPassword) async {
    await reAuthentification(email, password);
    await _auth.currentUser!.updatePassword(newPassword);
  }

  Future<void> reAuthentification(String email, String password) async {
    await _auth.currentUser?.reauthenticateWithCredential(
      EmailAuthProvider.credential(
        email: email,
        password: password,
      ),
    );
  }
}
