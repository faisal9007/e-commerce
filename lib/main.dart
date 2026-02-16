import 'package:e_commerce/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'app/crafty_bay_app.dart';
//firebase setup
//crashlytics setup
//analytics setup
//Localization setup
//folder structure
//architecture design
//theming setup
//firebase setup

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const CraftyBayApp());
}


