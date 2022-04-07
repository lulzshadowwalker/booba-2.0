import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import './LOCAL.dart';
import './helpers/lulz_imports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// init GetStorage
  /// simple key:value storage 
  await GetStorage.init();   

  /// init firebase
  GetPlatform.isWeb
      ? await Firebase.initializeApp(options: LOCAL.firebaseOptions)
      : await Firebase.initializeApp();

  runApp(const Booba());
}
