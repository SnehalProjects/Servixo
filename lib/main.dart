import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:servixo2/Screens/CategoriesScreen.dart';
import 'package:servixo2/Screens/HomeScreen.dart';
import 'package:servixo2/Screens/OnboardingScreen.dart';
import 'package:servixo2/Screens/ProfileScreen.dart';
import 'package:servixo2/Screens/ScheduleScreen.dart';
import 'package:servixo2/Screens/LoginScreen.dart';
import 'package:servixo2/Screens/SignupScreen.dart';
import 'package:servixo2/Screens/SettingScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Important
  await Firebase.initializeApp();            // Wait for Firebase
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Service App',
      theme: ThemeData.light(), // Light theme
      home: OnboardingScreen(), // Set LoginScreen as the main page
    );
  }
}
