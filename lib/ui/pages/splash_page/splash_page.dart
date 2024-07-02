import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:opticon_flutter/ui/controller/user_controller/user_controller.dart';
import 'package:opticon_flutter/ui/pages/auth_page/auth_page.dart';
import 'package:opticon_flutter/ui/pages/main_page/main_page.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});
  static const String routePath = "/splash";

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  void _listenUser(_, AsyncValue<User?> state) {
    state.when(
      data: (user) {
        if (user != null) {
          Future.delayed(const Duration(seconds: 2), () {
            Navigator.of(context).pushReplacementNamed(MainPage.routePath);
          });
        } else {
          Navigator.of(context).pushReplacementNamed(AuthPage.routePath);
        }
      },
      error: (e, st) {
        String message;

        if (e is FirebaseException) {
          message = switch (e.code) {
            'invalid-credential' => 'Email atau kata sandi salah',
            _ => e.message ?? e.code,
          };
        } else {
          message = e.toString();
        }

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(message),
          ),
        );
      },
      loading: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    ref.listen(userControllerProvider, _listenUser);
    return Scaffold(
      backgroundColor: colorScheme.primary,
      body: Center(
        child: Image.asset(
          'assets/op_logo.png',
          width: 200,
        ),
      ),
    );
  }
}
