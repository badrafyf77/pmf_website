import 'package:firebase_auth/firebase_auth.dart';
import 'package:pmf_website/core/models/user_model.dart';

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
      email: email,
      password: password,
    );
    return credential.user!;
  }

  Future<void> sendPasswordReset(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  Future<void> updateEmail(UserInformation user, String newEmail) async {
    await reAuthentification(user.email, user.password);
    await _auth.currentUser!.delete();

    await signUp(newEmail, user.password);
  }

  Future<void> updatePassword(UserInformation user, String newPassword) async {
    await reAuthentification(user.email, user.password);
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
