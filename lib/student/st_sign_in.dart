// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:colleagueapp/student/st_Home.dart';
import 'package:colleagueapp/student/st_registrastion.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StSignIn extends StatefulWidget {
  const StSignIn({super.key});

  @override
  State<StSignIn> createState() => _StSignInState();
}

class _StSignInState extends State<StSignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 280,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "Sign in",
                  style: GoogleFonts.poppins(
                      textStyle:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 33)),
                ),
              )
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "Sign into your account",
                  style: GoogleFonts.poppins(
                      textStyle:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 20)),
                ),
              )
            ],
          ),
          SizedBox(
            height: 87,
          ),
          SizedBox(
            width: 350,
            child: TextFormField(
              decoration: InputDecoration(hintText: "Email Adress"),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          SizedBox(
            width: 350,
            child: TextFormField(
              decoration: InputDecoration(hintText: "Email Adress"),
            ),
          ),
          SizedBox(
            height: 60,
          ),
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (ctx) {
                return StHome();
              }));
            },
            child: Container(
              height: 50,
              width: 360,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xff4472B2),
              ),
              child: Center(
                  child: Text(
                "Login",
                style: GoogleFonts.poppins(
                  textStyle:
                      TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                  color: Colors.white,
                ),
              )),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don’t have an account?",
                style: GoogleFonts.poppins(
                  textStyle:
                      TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                  color: Colors.black,
                ),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (ctx) => StRegistration()));
                  },
                  child: Text(
                    "Sign up",
                    style: GoogleFonts.poppins(
                      textStyle:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                    ),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
