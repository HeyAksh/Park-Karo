import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpScreen extends StatefulWidget {
  final String verificationId;
  final int? forceResendingToken;
  final String phoneNumber;
  const OtpScreen({
    super.key,
    required this.verificationId,
    this.forceResendingToken,
    required this.phoneNumber,
  });

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  late final TextEditingController _otpcontroller;

  @override
  void initState() {
    _otpcontroller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _otpcontroller.dispose();
    super.dispose();
  }

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
                    child: Text(
                      'Please Enter the OTP sent to ${widget.phoneNumber}',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                      ),
                    ),
                  ),

                  const SizedBox(height: 48),

                  SizedBox(
                    width: double.infinity,
                    child: PinCodeTextField(
                      controller: _otpcontroller,
                      appContext: context,
                      length: 6,
                      keyboardType: TextInputType.phone,
                      obscureText: false,
                      showCursor: true,
                      blinkWhenObscuring: true,
                      backgroundColor: Colors.black,
                      inputFormatters: [LengthLimitingTextInputFormatter(6)],
                      enableActiveFill: false,
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.underline,
                        borderWidth: 2,
                        fieldWidth: 30,
                        activeColor: Colors.white,
                        inactiveColor: Colors.grey,
                        selectedColor: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () async {
                  try {
                    final credential = PhoneAuthProvider.credential(
                      verificationId: widget.verificationId,
                      smsCode: _otpcontroller.text,
                    );

                    UserCredential userCredential = await FirebaseAuth.instance
                        .signInWithCredential(credential);

                    User? user = userCredential.user;

                    if (user != null) {
                      Navigator.pushReplacementNamed(context, '/setup');
                    } else {}
                  } on FirebaseAuthException catch (e) {}
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
