// ignore_for_file: prefer_const_constructors

import 'package:colleagueapp/teacher/te_registration.dart';
import 'package:colleagueapp/teacher/te_student_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class TeSignIn extends StatefulWidget {
  const TeSignIn({super.key});

  @override
  State<TeSignIn> createState() => _TeSignInState();
}

class _TeSignInState extends State<TeSignIn> {
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
                return TeStudentList();
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
                        MaterialPageRoute(builder: (ctx) => TeRegistration()));
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
