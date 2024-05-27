// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables, use_build_context_synchronously, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:colleagueapp/teacher/te_registration.dart';
import 'package:colleagueapp/teacher/te_student_list.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TeSignIn extends StatefulWidget {
  const TeSignIn({super.key});

  @override
  State<TeSignIn> createState() => _TeSignInState();
}

class _TeSignInState extends State<TeSignIn> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();

  Future<void> teacherSignInWithEmailAndPassword() async {
    if (formKey.currentState!.validate()) {
      String userEmail = controllerEmail.text.trim();
      String userPassword = controllerPassword.text.trim();

      var querySnapshot = await FirebaseFirestore.instance
          .collection('Teacher Sign')
          .where('Email', isEqualTo: userEmail)
          .limit(1)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        var userData = querySnapshot.docs.first.data();
        var passwordFromDB = userData['Password'] ;
        if (passwordFromDB != null && passwordFromDB == userPassword) {
          var teacherUid = userData['TeacherId'] ;
          if (teacherUid != null) {
            await teacherSaveData(teacherUid);
          }

          Navigator.push(context,
              MaterialPageRoute(builder: (context) => TeStudentList()));

          Fluttertoast.showToast(
            msg: 'Succesfully loggined',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        } else {
          print('incorrect password');
          Fluttertoast.showToast(
            msg: 'Incorrect Password',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        }
      } else {
        print('User not Fount');
        Fluttertoast.showToast(
          msg: 'User Not Found',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
    }
  }

  Future<void> teacherSaveData(String teacheruid) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("Teacher Uid", teacheruid);
  }

  var size, width, height;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      body: Form(
        key: formKey,
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
                          textStyle: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 33)),
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
                          textStyle: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 20)),
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
                  controller: controllerEmail,
                  decoration: InputDecoration(hintText: "Email Adress"),
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
                  controller: controllerPassword,
                  decoration: InputDecoration(hintText: "Password"),
                  validator: (value1) {
                    if (value1 == null || value1.isEmpty) {
                      return "Please enter your Password";
                    }
                    if (!RegExp((r'[A-Z]')).hasMatch(value1)) {
                      return 'Uppercase letter is missing';
                    }
                    if (!RegExp((r'[a-z]')).hasMatch(value1)) {
                      return 'Lowercase letter is missing';
                    }
                    if (!RegExp((r'[0-9]')).hasMatch(value1)) {
                      return 'Digit is missing';
                    }
                    if (value1.length < 5) {
                      return "Password must have at least 8 characters";
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
                  teacherSignInWithEmailAndPassword();
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
                                builder: (ctx) => TeRegistration()));
                      },
                      child: Text(
                        "Sign up",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w400),
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
