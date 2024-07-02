import 'package:firebase_auth/firebase_auth.dart';
import 'package:opticon_flutter/domain/repositories/user_repositories.dart';

abstract class UserServiceImpl {
  Future<User?> loginUser({required String email, required String password});
  Future<User?> loginWithGoogle();
  Future<User?> registerUser();
  Future<void> logoutUser();
  Future<User?> getCurrentUser();
}

class UserService {
  final UserRepository _userRepository;

  UserService(this._userRepository);

  Future<User?> loginUser(
      {required String email, required String password}) async {
    final res =
        await _userRepository.loginUser(email: email, password: password);
    return res;
  }

  Future<User?> loginWithGoogle() async {
    return await _userRepository.loginWithGoogle();
  }

  Future<User?> registerUser() async {
    return await _userRepository.registerUser();
  }

  Future<User?> logoutUser() async {
    await _userRepository.logoutUser();
    return null;
  }

  Future<User?> getCurrentUser() async {
    return await _userRepository.getCurrentUser();
  }
}
