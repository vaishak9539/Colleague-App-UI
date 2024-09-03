// ignore_for_file: prefer_const_constructors, use_full_hex_values_for_flutter_colors, use_build_context_synchronously, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:colleagueapp/admin/ad_request_request.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdLogin extends StatefulWidget {
  const AdLogin({super.key});

  @override
  State<AdLogin> createState() => _AdLoginState();
}

class _AdLoginState extends State<AdLogin> {
  final formkey = GlobalKey<FormState>();
  final TextEditingController adcontrollerEmail = TextEditingController();
  final TextEditingController adcontrollerPassword = TextEditingController();

  Future<void> adminSignWithEmailAndPassword() async {
    if (formkey.currentState != null && formkey.currentState!.validate()) {
      String adminEmail = adcontrollerEmail.text.trim();
      String adminPassword = adcontrollerPassword.text.trim();

      try {
        var querySnapshot = await FirebaseFirestore.instance
            .collection("AdminSign")
            .where("Email", isEqualTo: adminEmail)
            .limit(1)
            .get();

        if (querySnapshot.docs.isNotEmpty) {
          var adminData = querySnapshot.docs.first.data();
          var passwordFromDB = adminData["Password"];
          if (passwordFromDB != null && passwordFromDB == adminPassword) {
            var adminID = adminData["AdminID"];
            if (adminID != null) {
              await adminSaveData(adminID);
            }
            Navigator.push(context,
                MaterialPageRoute(builder: (ctx) => AdRequestRequest()));
            Fluttertoast.showToast(
              msg: "Succesfully loggined",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black54,
              textColor: Colors.white,
              fontSize: 16.0,
            );
          } else {
            print('Incorrect password');
            Fluttertoast.showToast(msg: "Incorrect password");
          }
        } else {
          print('User not found');
          Fluttertoast.showToast(msg: "User not found");
        }
      } catch (e) {
        print('Error fetching admin data: $e');
        Fluttertoast.showToast(msg: "Error fetching admin data");
      }
    }
  }

  Future<void> adminSaveData(String uid) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("uid", uid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 350,
          width: 350,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color(0xf4472B2),
          ),
          child: Form(
            key: formkey,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Text(
                        "Login",
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff4472B2),
                        )),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                  child: TextFormField(
                    controller: adcontrollerEmail,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.grey,
                        ),
                        hintText: "email"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "please enter your email";
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
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
                  child: TextFormField(
                    controller: adcontrollerPassword,
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.grey,
                        ),
                        hintText: "Password"),
                    validator: (value1) {
                      if (value1 == null || value1.isEmpty) {
                        return "Please enter your Password";
                      }
                      if (value1.length < 6) {
                        return "Password must have at least 6 characters";
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
                  height: 40,
                ),
                InkWell(
                  onTap: () {
                    adminSignWithEmailAndPassword();
                  },
                  child: Container(
                    height: 50,
                    width: 280,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xff4472B2),
                    ),
                    child: Center(
                        child: Text(
                      "Login",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                        color: Colors.white,
                      ),
                    )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
