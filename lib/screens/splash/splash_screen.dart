import 'package:flutter/material.dart';

import '../signup/signup_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SignUpScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Park ',
              style: TextStyle(
                color: Color(0xffffffff),
                fontWeight: FontWeight.bold,
                fontSize: 36,
              ),
            ),
            const Text(
              'Karo',
              style: TextStyle(
                color: Color(0xffe7fe54),
                fontWeight: FontWeight.bold,
                fontSize: 36,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
