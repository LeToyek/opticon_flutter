import 'package:firebase_auth/firebase_auth.dart';
import 'package:opticon_flutter/application/services.dart';
import 'package:opticon_flutter/application/user_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_controller.g.dart';

@riverpod
class UserController extends _$UserController {
  UserService get _service => ref.read(userServiceProvider);

  @override
  FutureOr<User?> build() async => await _service.getCurrentUser();

  void loginUser({required String email, required String password}) async {
    state = await AsyncValue.guard(
        () => _service.loginUser(email: email, password: password));
  }

  Future<void> loginWithGoogle() async {
    try {
      state = await AsyncValue.guard(() => _service.loginWithGoogle());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> registerUser() async {
    try {
      state = await AsyncValue.guard(() => _service.registerUser());
    } catch (e) {
      throw Exception("Error registering user");
    }
  }

  void logoutUser() async {
    state = await AsyncValue.guard(() => _service.logoutUser());
  }
}
