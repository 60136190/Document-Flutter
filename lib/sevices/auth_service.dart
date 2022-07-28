import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth;
  AuthenticationService(this._firebaseAuth);

  Stream<User?> get authStateChange => _firebaseAuth.authStateChanges();

  Future<String?> signIn(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return "Login successful";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<String?> signUp(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return "Sign in successful";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<String?> signOut() async {
    try {
      await _firebaseAuth.signOut();
      return "Sign out successful";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }
}
