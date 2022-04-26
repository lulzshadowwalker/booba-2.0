import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';

import 'helpers/lulz_imports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// restrict screen orientatio
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  /// simple key:value storage
  await GetStorage.init();

   await Firebase.initializeApp();

  runApp(const Booba());
}
