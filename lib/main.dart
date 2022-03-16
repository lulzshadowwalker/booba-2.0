import './helpers/lulz_imports.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './LOCAL.dart';

/// Send Firebase Options file to the other machine

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// init firebase
  GetPlatform.isWeb
      ? await Firebase.initializeApp(options: LOCAL.firebaseOptions)
      : await Firebase.initializeApp();

  runApp(const Booba());
}
