import 'package:flutter/material.dart';

class SetupScreen extends StatefulWidget {
  const SetupScreen({super.key});

  @override
  State<SetupScreen> createState() => _SetupScreenState();
}

class _SetupScreenState extends State<SetupScreen> {
  late final TextEditingController _fullname;
  late final TextEditingController _email;

  @override
  void initState() {
    _fullname = TextEditingController();
    _email = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _fullname.dispose();
    _email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.black),
        child: Padding(
          padding: const EdgeInsets.only(left: 50.0, right: 50.0, bottom: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  const Text(
                    'Set Up Your Park Karo account',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                      color: Colors.white,
                    ),
                  ),

                  const SizedBox(height: 17),

                  const Text(
                    '''Your name helps house owners identify you. An email address lets us share parking receipts''',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 13.5,
                      fontWeight: FontWeight.normal,
                      color: Color(0xffa1a1aa),
                    ),
                  ),

                  const SizedBox(height: 75),

                  TextField(
                    controller: _fullname,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      hintText: 'Full Name',
                      hintStyle: TextStyle(fontSize: 18),
                    ),
                  ),

                  const SizedBox(height: 40),

                  TextField(
                    controller: _email,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'Email(Optional)',
                      hintStyle: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: const Text(
                        'Finish Setup',
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
