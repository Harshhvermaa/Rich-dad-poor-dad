import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:richdadpoordad/firebase_options.dart';
import 'package:richdadpoordad/global.dart';
import 'package:richdadpoordad/screens/homescreen.dart';
import 'package:richdadpoordad/screens/onBoardingone2.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/onBoardingone1.dart';

void main(List<String> args) async {
  await WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp
  (
    options: DefaultFirebaseOptions.currentPlatform
  );
  sharedPreferences = await SharedPreferences.getInstance();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp
    (
      home: 
       sharedPreferences!.getString("Username") == null ? 
      onBoardingtwo()
      : Homescreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}