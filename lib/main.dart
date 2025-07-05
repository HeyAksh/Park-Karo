import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:parkkaro/screens/signup/setup_screen.dart';
import 'package:parkkaro/screens/splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Park Karo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const SplashScreen(),
      routes: {'/setup': (context) => const SetupScreen()},
    );
  }
}
