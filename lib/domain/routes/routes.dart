import 'package:flutter/material.dart';
import 'package:opticon_flutter/ui/pages/auth_page/auth_page.dart';
import 'package:opticon_flutter/ui/pages/guidance_page/guidance_health_page.dart';
import 'package:opticon_flutter/ui/pages/guidance_page/guidance_page.dart';
import 'package:opticon_flutter/ui/pages/iot_page/iot_device_page.dart';
import 'package:opticon_flutter/ui/pages/main_page/main_page.dart';
import 'package:opticon_flutter/ui/pages/prediction_page/prediciton_page.dart';
import 'package:opticon_flutter/ui/pages/qr_page/qr_page.dart';
import 'package:opticon_flutter/ui/pages/splash_page/splash_page.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'routes.g.dart';

@riverpod
Map<String, Widget Function(BuildContext context)> routes(RoutesRef ref) {
  return {
    MainPage.routePath: (context) => const MainPage(),
    IOTDevice.routePath: (context) => const IOTDevice(),
    GuidancePage.routePath: (context) => GuidancePage(),
    GuidanceHealthPage.routePath: (context) => GuidanceHealthPage(),
    AuthPage.routePath: (context) => const AuthPage(),
    QRPage.routePath: (context) => const QRPage(),
    PredictionPage.routePath: (context) => const PredictionPage(),
    SplashPage.routePath: (context) => const SplashPage(),
  };
}
