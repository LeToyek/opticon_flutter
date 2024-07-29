import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:opticon_flutter/bootstrap.dart';
import 'package:opticon_flutter/domain/routes/routes.dart';
import 'package:opticon_flutter/firebase_options.dart';
import 'package:opticon_flutter/ui/pages/splash_page/splash_page.dart';
import 'package:opticon_flutter/ui/theme/theme.dart';
import 'package:opticon_flutter/ui/widgets/window_overlay/heart_beat_overlay.dart';

void main() async {
  bootstrap();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routes = ref.read(routesProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      title: 'Flutter Demo',
      theme: lightTheme,
      themeMode: ThemeMode.light,
      routes: routes,
      initialRoute: SplashPage.routePath,
    );
  }
}

// overlay entry point
@pragma("vm:entry-point")
void overlayMain() async {
  bootstrap();
  runApp(const ProviderScope(
    child: OverlayApp(),
  ));
}

class OverlayApp extends ConsumerWidget {
  const OverlayApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
        theme: lightTheme,
        debugShowCheckedModeBanner: false,
        home: const HeartBeatOverlay());
  }
}
