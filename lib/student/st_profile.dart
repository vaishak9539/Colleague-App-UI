// ignore_for_file: prefer_const_constructors, use_full_hex_values_for_flutter_colors, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:colleagueapp/student/st_edit_profile.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StProfile extends StatefulWidget {
  const StProfile({super.key});

  @override
  State<StProfile> createState() => _StProfileState();
}

class _StProfileState extends State<StProfile> {
  var name = TextEditingController();
  var department = TextEditingController();
  var phone = TextEditingController();
  var email = TextEditingController();
  var registerNo = TextEditingController();
  var formkey = GlobalKey<FormState>();

  String? imageurl;
  bool isLoading = false;

  Future<void> fechStudentDetails() async {
    setState(() {
      isLoading = true;
    });

    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? stid = prefs.getString("StudentUid");
      print("Shared Preference Student ID: $stid");

      if (stid != null && stid.isNotEmpty) {
        Stream<DocumentSnapshot> studentStream = FirebaseFirestore.instance
            .collection("StudentSign")
            .doc(stid)
            .snapshots();
        studentStream.listen((studentSnapshot) {
          if (studentSnapshot.exists) {
            setState(() {
              name.text = studentSnapshot["Name"] ?? '';
              department.text = studentSnapshot["Department"] ?? '';
              registerNo.text = studentSnapshot["RegisterNo"] ?? '';
              phone.text = studentSnapshot["PhoneNumber"] ?? '';
              email.text = studentSnapshot["Email"] ?? '';
              imageurl = studentSnapshot["imageurl"] ?? '';
            });
          }
        });
      }
    } catch (e) {
      print('Error Fetching Student details: $e');
      Fluttertoast.showToast(msg: "Error fetching Student details: $e");
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fechStudentDetails();
  }

  var size, width, height;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
        ),
        centerTitle: true,
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StEditProfile(),
                        ));
                  },
                  icon: Icon(Icons.edit)))
        ],
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Form(
              key: formkey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 23),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundImage:
                                imageurl != null && imageurl!.isNotEmpty
                                    ? NetworkImage(imageurl!)
                                    : null,
                            child: imageurl == null || imageurl!.isEmpty
                                ? Icon(Icons.person, size: 50)
                                : null,
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 30, top: 20),
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
                              controller: name,
                              readOnly: true,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(6))),
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
                              controller: department,
                              readOnly: true,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(6))),
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
                              controller: registerNo,
                              readOnly: true,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(6))),
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
                              controller: phone,
                              readOnly: true,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(6))),
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
                            "Email ID",
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
                              controller: email,
                              readOnly: true,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(6))),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 60,
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
