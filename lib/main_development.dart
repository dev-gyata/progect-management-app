import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:progect_management_app/app/app.dart';
import 'package:progect_management_app/bootstrap.dart';

import 'package:progect_management_app/firebase_options_dev.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await bootstrap(() => const App());
}
