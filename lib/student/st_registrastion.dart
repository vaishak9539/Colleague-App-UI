// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_full_hex_values_for_flutter_colors, prefer_typing_uninitialized_variables, use_build_context_synchronously, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:colleagueapp/student/st_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class StRegistration extends StatefulWidget {
  const StRegistration({super.key});

  @override
  State<StRegistration> createState() => _StRegistrationState();
}

class _StRegistrationState extends State<StRegistration> {
  final formkey = GlobalKey<FormState>();
  final TextEditingController controllerName = TextEditingController();
  final TextEditingController controllerDepartment = TextEditingController();
  final TextEditingController controllerRegisterNo = TextEditingController();
  final TextEditingController controllerPhoneNumber = TextEditingController();
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();

  Future<void> validationCheckingStudent() async {
    if (formkey.currentState!.validate()) {
      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: controllerEmail.text,
          password: controllerPassword.text,
        );
        String studentAuthenticationUid = userCredential.user!.uid;

        await FirebaseFirestore.instance
            .collection("StudentSign")
            .doc(studentAuthenticationUid)
            .set({
          "Name": controllerName.text,
          "Department": controllerDepartment.text,
          "RegisterNo": controllerRegisterNo.text,
          "PhoneNumber": controllerPhoneNumber.text,
          "Email": controllerEmail.text,
          "Password": controllerPassword.text,
          'StudentId': studentAuthenticationUid,
          'Created at' : DateTime.now()
        });
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
              //  StHome(),
              StSignIn()
            ));
      } on FirebaseAuthException catch (e) {
        print("Failed to register : $e");
        String errorMessage = "Registration failed. ${e.message}";

        if (e.code == 'Email-already-in-use') {
          errorMessage =
              "Email is already in use. Please use a different email";
        }
        Fluttertoast.showToast(msg: errorMessage);
      } catch (e) {
        print("Unexpected error during registration: $e");
        Fluttertoast.showToast(msg: "Unexpected error during registration");
      }
    }
  }

  var size, width, height;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Form(
            key: formkey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Registration",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 18),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30, top: 45),
                        child: Text(
                          "Name",
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 15),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 25, top: 6),
                        child: SizedBox(
                          height: height / 17,
                          width: width / 1.2,
                          child: TextFormField(
                            controller: controllerName,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6))),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter your Name";
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30, top: 15),
                        child: Text(
                          "Department",
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 15),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 25, top: 6),
                        child: SizedBox(
                          height: height / 17,
                          width: width / 1.2,
                          child: TextFormField(
                            controller: controllerDepartment,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6))),
                            validator: (value1) {
                              if (value1 == null || value1.isEmpty) {
                                return "Please enter your Department";
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30, top: 15),
                        child: Text(
                          "Register No",
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 15),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 25, top: 6),
                        child: SizedBox(
                          height: height / 17,
                          width: width / 1.2,
                          child: TextFormField(
                            controller: controllerRegisterNo,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6))),
                            validator: (value2) {
                              if (value2 == null || value2.isEmpty) {
                                return "Please enter your Register No";
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30, top: 15),
                        child: Text(
                          "Phone No",
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 15),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 25, top: 6),
                        child: SizedBox(
                          height: height / 17,
                          width: width / 1.2,
                          child: TextFormField(
                            controller: controllerPhoneNumber,
                                                        keyboardType: TextInputType.number,

                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6))),
                            validator: (value3) {
                              if (value3 == null || value3.isEmpty) {
                                return "Please enter your number";
                              }
                              if (value3.length < 10) {
                                return "Password must have at least 10 characters";
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30, top: 15),
                        child: Text(
                          "Email",
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 15),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 25, top: 6),
                        child: SizedBox(
                          height: height / 17,
                          width: width / 1.2,
                          child: TextFormField(
                            controller: controllerEmail,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6))),
                            validator: (value4) {
                              if (value4 == null || value4.isEmpty) {
                                return "Please enter your Email";
                              }
                              if (!RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(value4)) {
                                return 'Enter a valid email!';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30, top: 15),
                        child: Text(
                          "Password",
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 15),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 25, top: 6),
                        child: SizedBox(
                          height: height / 17,
                          width: width / 1.2,
                          child: TextFormField(
                            controller: controllerPassword,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6))),
                            validator: (value5) {
                              if (value5 == null || value5.isEmpty) {
                                return "Please enter your Password";
                              }
                              if (!RegExp((r'[A-Z]')).hasMatch(value5)) {
                                return 'Uppercase letter is missing';
                              }
                              if (!RegExp((r'[a-z]')).hasMatch(value5)) {
                                return 'Lowercase letter is missing';
                              }
                              if (!RegExp((r'[0-9]')).hasMatch(value5)) {
                                return 'Digit is missing';
                              }
                              if (value5.length < 8) {
                                return "Password must have at least 8 characters";
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height / 13,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () => validationCheckingStudent(),
                        child: Container(
                          height: height / 17,
                          width: width / 1.2,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: Color(0xffb4472B2)),
                          child: Center(
                            child: Text(
                              "Submit",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
