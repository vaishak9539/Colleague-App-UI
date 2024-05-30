// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, avoid_print, prefer_const_literals_to_create_immutables, use_full_hex_values_for_flutter_colors, prefer_typing_uninitialized_variables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:colleagueapp/teacher/te_student_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TeRegistration extends StatefulWidget {
  const TeRegistration({Key? key}) : super(key: key);

  @override
  State<TeRegistration> createState() => _TeRegistrationState();
}

class _TeRegistrationState extends State<TeRegistration> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController controllerName = TextEditingController();
  final TextEditingController controllerDepartment = TextEditingController();
  final TextEditingController controllerPhoneNumber = TextEditingController();
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();

  Future<void> validationChecking() async {
    if (formKey.currentState!.validate()) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: controllerEmail.text, password: controllerPassword.text);
                
        String teacherAuthenticationUid = userCredential.user!.uid;

        await FirebaseFirestore.instance
            .collection("TeacherSign")
            .doc(teacherAuthenticationUid)
            .set({
          "Name": controllerName.text,
          "Department": controllerDepartment.text,
          "PhoneNumber": controllerPhoneNumber.text,
          "Email": controllerEmail.text,
          "Password": controllerPassword.text,
          'TeacherId': teacherAuthenticationUid,
        });
          Fluttertoast.showToast(msg: "regisration succussfully");
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => TeStudentList()),
        );
      } on FirebaseAuthException catch (e) {
        print('Failed to register user: $e');
        String errorMessage = "Registration failed. ${e.message}";

        if (e.code == "email-already-in-use") {
          errorMessage =
              "Email is already in use. Please use a different email";
        }
        Fluttertoast.showToast(
          msg: errorMessage,
        );
      } catch (e) {
        print('Unexpected error during registration: $e');
        Fluttertoast.showToast(
          msg: "Unexpected error during registration",
        );
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
          padding: const EdgeInsets.only(top: 56),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Registration",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 25, top: 60),
                        child: Text(
                          "Name",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 6),
                        child: SizedBox(
                          height: height / 17,
                          width: width / 1.2,
                          child: TextFormField(
                            controller: controllerName,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
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
                        padding: const EdgeInsets.only(left: 25, top: 15),
                        child: Text(
                          "Department",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 6),
                        child: SizedBox(
                          height: height / 17,
                          width: width / 1.2,
                          child: TextFormField(
                            controller: controllerDepartment,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
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
                        padding: const EdgeInsets.only(left: 25, top: 15),
                        child: Text(
                          "Phone No",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 6),
                        child: SizedBox(
                          height: height / 17,
                          width: width / 1.2,
                          child: TextFormField(
                            controller: controllerPhoneNumber,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter your Phone No";
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
                        padding: const EdgeInsets.only(left: 25, top: 15),
                        child: Text(
                          "Email",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 6),
                        child: SizedBox(
                          height: height / 17,
                          width: width / 1.2,
                          child: TextFormField(
                            controller: controllerEmail,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
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
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 25, top: 15),
                        child: Text(
                          "Password",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 6),
                        child: SizedBox(
                          height: height / 17,
                          width: width / 1.2,
                          child: TextFormField(
                            controller: controllerPassword,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                            validator: (value2) {
                              if (value2 == null || value2.isEmpty) {
                                return "Please enter your Password";
                              }
                              if (!RegExp((r'[A-Z]')).hasMatch(value2)) {
                                return 'Uppercase letter is missing';
                              }
                              if (!RegExp((r'[a-z]')).hasMatch(value2)) {
                                return 'Lowercase letter is missing';
                              }
                              if (!RegExp((r'[0-9]')).hasMatch(value2)) {
                                return 'Digit is missing';
                              }
                              if (value2.length < 5) {
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
                    height: height / 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () => validationChecking(),
                        child: Container(
                          height: height / 17,
                          width: width / 1.2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: Color(0xffb4472B2),
                          ),
                          child: Center(
                            child: Text(
                              "Submit",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
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
