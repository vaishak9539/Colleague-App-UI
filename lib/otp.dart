// ignore_for_file: use_build_context_synchronously, prefer_const_constructors

import 'package:colleagueapp/otp2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyPhone extends StatefulWidget {
  const MyPhone({super.key});
  static String verify = "";

  @override
  State<MyPhone> createState() => _MyPhoneState();
}

class _MyPhoneState extends State<MyPhone> {
  var phone = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Enter your Phone number'),
          Padding(
            padding: const EdgeInsets.all(28.0),
            child: TextField(
              keyboardType: TextInputType.phone,
              onChanged: (value) {
                phone = value;
              },
            ),
          ),
          ElevatedButton(
              onPressed: () async {
                await FirebaseAuth.instance.verifyPhoneNumber(
                  phoneNumber: '+91$phone',
                  verificationCompleted: (PhoneAuthCredential credential) {},
                  verificationFailed: (FirebaseAuthException e) {},
                  codeSent: (String verificationId, int? resendToken) {
                    MyPhone.verify = verificationId;
                    Navigator.pushNamed(context, "otp");
                  },
                  codeAutoRetrievalTimeout: (String verificationId) {},
                );
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return MyOtp();
                  },
                ));
              },
              child: const Text('send the code'))
        ],
      ),
    );
  }
}