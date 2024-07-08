import 'package:firebase_auth/firebase_auth.dart';
import '../models/user_model.dart';

class AuthViewModel {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<UserModel?> register(String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = userCredential.user;
      return user != null ? UserModel(uid: user.uid, email: user.email!) : null;
    } catch (e) {
      throw Exception('Registration failed: $e');
    }
  }

  Future<UserModel?> login(String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = userCredential.user;
      return user != null ? UserModel(uid: user.uid, email: user.email!) : null;
    } catch (e) {
      throw Exception('Login failed: $e');
    }
  }
}
