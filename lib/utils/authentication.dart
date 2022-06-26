import 'package:firebase_auth/firebase_auth.dart';

class Authentication {
  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  static User? currentFirebaseUser;

  static Future<dynamic> signUp(String email, String pass) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: pass);
      print('auth登録完了');
      return true;
    } on FirebaseAuthException catch (e) {
      print('auth登録エラー: $e');
      return false;
    }
  }

  static Future<dynamic> emailSignIn(String email, String pass) async {
    try {
      final UserCredential _result = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: pass);
      currentFirebaseUser = _result.user;
      print('authサインイン完了');
      return true;
    } on FirebaseAuthException catch (e) {
      print('authサインインエラー: $e');
      return false;
    }
  }
}