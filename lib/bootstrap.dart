import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void bootstrap() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
}
