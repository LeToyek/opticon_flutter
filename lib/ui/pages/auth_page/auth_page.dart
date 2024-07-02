import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ionicons/ionicons.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:opticon_flutter/ui/controller/user_controller/user_controller.dart';
import 'package:opticon_flutter/ui/pages/main_page/main_page.dart';
import 'package:opticon_flutter/ui/widgets/cards/plain_card.dart';
import 'package:opticon_flutter/utils/validator.dart';

class AuthPage extends ConsumerStatefulWidget {
  const AuthPage({super.key});

  static const String routePath = "/auth";

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AuthPageState();
}

class _AuthPageState extends ConsumerState<AuthPage> {
  final formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isLoading = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _listenUser(_, AsyncValue<User?> state) {
    state.when(
      data: (user) {
        if (user != null) {
          Navigator.of(context).pushReplacementNamed(MainPage.routePath);
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
        body: Stack(
      children: [
        isLoading
            ? Center(
                child: LoadingAnimationWidget.staggeredDotsWave(
                    color: colorScheme.primary, size: 200),
              )
            : Container(),
        Padding(
            padding: const EdgeInsets.all(24.0),
            child: Center(
              child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                            labelText: 'Email',
                            labelStyle:
                                TextStyle(color: colorScheme.onBackground)),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          } else if (!isValidEmail(value)) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle:
                                TextStyle(color: colorScheme.onBackground)),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 24),
                      PlainCard(
                          onTap: () async => submitForm(),
                          color: colorScheme.primary,
                          child: Row(
                            children: [
                              const Icon(Ionicons.log_in, color: Colors.white),
                              const SizedBox(width: 12),
                              Text(
                                'Masuk',
                                style: textTheme.bodyMedium!.apply(
                                    fontWeightDelta: 2, color: Colors.white),
                              ),
                            ],
                          )),
                      const SizedBox(height: 12),
                      PlainCard(
                          onTap: loginWithGoogle,
                          color: colorScheme.error,
                          child: Row(
                            children: [
                              const Icon(Ionicons.logo_google,
                                  color: Colors.white),
                              const SizedBox(width: 12),
                              Text(
                                'Masuk Dengan Google',
                                style: textTheme.bodyMedium!.apply(
                                    fontWeightDelta: 2, color: Colors.white),
                              ),
                            ],
                          )),
                      const SizedBox(height: 24),
                      TextButton(
                        onPressed: () {
                          print('Daftar disini');
                        },
                        child: const Text('Belum punya akun? Daftar disini'),
                      ),
                    ],
                  )),
            )),
      ],
    ));
  }

  Future<void> loginWithGoogle() async {
    try {
      isLoading = true;
      print("login with google");
      ref.read(userControllerProvider.notifier).loginWithGoogle();
      print("finished");
      isLoading = false;
    } catch (e) {
      if (context.mounted) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Error"),
            content: Text(e.toString()),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("OK"))
            ],
          ),
        );
      }
    }
  }

  Future<void> submitForm() async {
    if (formKey.currentState!.validate()) {
      // Process data.
      try {
        String email = emailController.text;
        String password = passwordController.text;
        ref
            .read(userControllerProvider.notifier)
            .loginUser(email: email, password: password);
      } catch (e) {
        if (context.mounted) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text("Error"),
              content: Text(e.toString()),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("OK"))
              ],
            ),
          );
        }
      }
    }
  }
}
