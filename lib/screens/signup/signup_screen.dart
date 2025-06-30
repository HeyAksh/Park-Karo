import 'package:flutter/material.dart';
import 'package:parkkaro/screens/signup/phonenumber_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: const PhoneNumberScreen(),
    );
  }
}
