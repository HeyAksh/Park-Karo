import 'package:flutter/material.dart';
import 'package:parkkaro/screens/signup/setup_screen.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.black),
        child: Padding(
          padding: EdgeInsets.only(left: 50.0, right: 50.0, bottom: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Center(
                    child: const Text(
                      'Please Enter the OTP sent to +917876602190',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                      ),
                    ),
                  ),

                  const SizedBox(height: 48),

                  PinCodeTextField(
                    appContext: context,
                    length: 4,
                    keyboardType: TextInputType.phone,
                    obscureText: false,
                    showCursor: true,
                    blinkWhenObscuring: true,
                    backgroundColor: Colors.black,
                    enableActiveFill: false,
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.underline,
                      borderWidth: 2,
                      activeColor: Colors.white,
                      inactiveColor: Colors.grey,
                      selectedColor: Colors.blue,
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SetupScreen(),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 12.0),
                      child: const Text(
                        'Verify',
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
