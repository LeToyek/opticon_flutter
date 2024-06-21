import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class UserRepositoryImpl {
  Future<User?> loginUser({required String email, required String password});
  Future<User?> loginWithGoogle();
  Future<User?> registerUser();
  Future<User?> logoutUser();
  Future<User?> getCurrentUser();
}

class UserRepository implements UserRepositoryImpl {
  final FirebaseAuth _firebaseAuth;

  UserRepository(this._firebaseAuth);

  @override
  Future<User?> loginUser(
      {required String email, required String password}) async {
    final res = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    return res.user;
  }

  @override
  Future<User?> loginWithGoogle() async {
    try {
      List<String> scopes = [
        'email',
        'https://www.googleapis.com/auth/contacts.readonly',
      ];

      final googleSignIn = GoogleSignIn(
        scopes: scopes,
        serverClientId: dotenv.env['GOOGLE_CLIENT_ID'],
      );

      final googleUser = await googleSignIn.signIn();

      GoogleSignInAuthentication googleAuth = await googleUser!.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      User? user = (await _firebaseAuth.signInWithCredential(credential)).user;
      return user;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<User?> logoutUser() {
    // TODO: implement logoutUser
    throw UnimplementedError();
  }

  @override
  Future<User?> registerUser() {
    // TODO: implement registerUser
    throw UnimplementedError();
  }

  @override
  Future<User?> getCurrentUser() async {
    try {
      return _firebaseAuth.currentUser;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
