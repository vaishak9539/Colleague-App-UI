// ignore_for_file: use_build_context_synchronously, prefer_const_constructors, avoid_print, prefer_typing_uninitialized_variables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:colleagueapp/student/st_Home.dart';
import 'package:colleagueapp/student/st_registrastion.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StSignIn extends StatefulWidget {
  const StSignIn({super.key});

  @override
  State<StSignIn> createState() => _StSignInState();
}

class _StSignInState extends State<StSignIn> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController stcontrollerEmail = TextEditingController();
  final TextEditingController stcontrollerPassword = TextEditingController();

  Future<void> studentSignWithEmailAndPassword() async {
    if (formkey.currentState!.validate()) {
      String studentEmail = stcontrollerEmail.text.trim();
      String studentPassword = stcontrollerPassword.text.trim();

      var querySnapshot = await FirebaseFirestore.instance
          .collection("Student Sign")
          .where("Email", isEqualTo: studentEmail)
          .limit(1)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        var studentsData = querySnapshot.docs.first.data();
        var passwordFromDB = studentsData['password'];
        if (passwordFromDB != null && passwordFromDB == studentPassword) {
          var studentUid = studentsData["StudentId"];
          if (studentUid != null) {
            await studentsavedata(studentUid);
          }
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return StHome();
          }));
          Fluttertoast.showToast(msg: "Successfully logged in");
        } else {
          print('Incorrect password');
          Fluttertoast.showToast(msg: "Incorrect password");
        }
      } else {
        print('User not found');
        Fluttertoast.showToast(msg: "User not found");
      }
    }
  }

  Future<void> studentsavedata(String uid) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("Student Uid", uid);
  }

  var size, width, height;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      body: Form(
        key: formkey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: height / 3,
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
                width: width / 1.1,
                child: TextFormField(
                  controller: stcontrollerEmail,
                  decoration: InputDecoration(hintText: "Email Address"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your Email";
                    }
                    if (!RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value)) {
                      return 'Enter a valid email!';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 40,
              ),
              SizedBox(
                width: width / 1.1,
                child: TextFormField(
                  controller: stcontrollerPassword,
                  decoration: InputDecoration(hintText: "Password"),
                  validator: (value1) {
                    if (value1 == null || value1.isEmpty) {
                      return "Please enter your Password";
                    }
                    if (value1.length < 8) {
                      return "Password must have at least 8 characters";
                    }
                    if (!RegExp(r'[A-Z]').hasMatch(value1)) {
                      return 'Uppercase letter is missing';
                    }
                    if (!RegExp(r'[a-z]').hasMatch(value1)) {
                      return 'Lowercase letter is missing';
                    }
                    if (!RegExp(r'[0-9]').hasMatch(value1)) {
                      return 'Digit is missing';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 60,
              ),
              InkWell(
                onTap: () {
                  studentSignWithEmailAndPassword();
                },
                child: Container(
                  height: height / 16,
                  width: width / 1.2,
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (ctx) => StRegistration()));
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
        ),
      ),
    );
  }
}
