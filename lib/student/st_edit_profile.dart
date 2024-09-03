// ignore_for_file: prefer_const_constructors, use_full_hex_values_for_flutter_colors, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables, avoid_print, use_build_context_synchronously

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StEditProfile extends StatefulWidget {
  const StEditProfile({super.key});

  @override
  State<StEditProfile> createState() => _StEditProfileState();
}

class _StEditProfileState extends State<StEditProfile> {
  var name = TextEditingController();
  var department = TextEditingController();
  var phone = TextEditingController();
  var email = TextEditingController();
  var registerNo = TextEditingController();

  XFile? pick;
  File? image;
  String? imageurl;
  bool isLoading = false;

  Future<void> pickimage() async {
    ImagePicker picked = ImagePicker();
    pick = await picked.pickImage(source: ImageSource.gallery);
    setState(() {
      image = File(pick!.path);
    });
  }

  Future<void> getStudentDetails() async {
    setState(() {
      isLoading = true;
    });
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? stid = prefs.getString("StudentUid");
      print("Shared Preference Student ID: $stid");

      if (stid != null && stid.isNotEmpty) {
        DocumentSnapshot studentSnapshot = await FirebaseFirestore.instance
            .collection("StudentSign")
            .doc(stid)
            .get();

        if (studentSnapshot.exists) {
          setState(() {
            name.text = studentSnapshot["Name"];
            department.text = studentSnapshot["Department"];
            registerNo.text = studentSnapshot["RegisterNo"];
            phone.text = studentSnapshot["PhoneNumber"];
            email.text = studentSnapshot["Email"];
            imageurl = studentSnapshot["imageurl"];
          });
        }
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

  Future<void> profileimg() async {
    if (image != null) {
      var ref = FirebaseStorage.instance
          .ref()
          .child('StProfileImage')
          .child(DateTime.now().millisecondsSinceEpoch.toString());
      await ref.putFile(image!);
      var imgurl = await ref.getDownloadURL();
      setState(() {
        imageurl = imgurl;
      });
    }
  }

  Future<void> updateStudentData() async {
    if (name.text.isNotEmpty &&
        department.text.isNotEmpty &&
        registerNo.text.isNotEmpty &&
        phone.text.isNotEmpty &&
        email.text.isNotEmpty) {
      setState(() {
        isLoading = true;
      });
      try {
        SharedPreferences prfs = await SharedPreferences.getInstance();
        var stid = prfs.getString('StudentUid');
        print("Shared Preference Student ID: $stid");

        if (stid != null && stid.isNotEmpty) {
          await FirebaseFirestore.instance
              .collection("StudentSign")
              .doc(stid)
              .update({
            "Name": name.text,
            "Department": department.text,
            "RegisterNo": registerNo.text,
            "PhoneNumber": phone.text,
            "Email": email.text,
            'imageurl': imageurl ?? '',
          });
          Fluttertoast.showToast(
            msg: "Profile Successfully Updated",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black54,
            textColor: Colors.white,
            fontSize: 16.0,
          );
          Navigator.of(context).pop();
        }
      } catch (e) {
        print("Error updating Student data: $e");
        Fluttertoast.showToast(
          msg: "Error updating Student data: $e",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black54,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      } finally {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  void initState() {
    getStudentDetails();
    super.initState();
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
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 23),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            pickimage();
                          },
                          child: CircleAvatar(
                            radius: 50,
                            backgroundImage: image != null
                                ? FileImage(image!) as ImageProvider<Object>
                                : (imageurl != null && imageurl!.isNotEmpty)
                                    ? NetworkImage(imageurl!)
                                    : null,
                            child: image == null &&
                                    (imageurl == null || imageurl!.isEmpty)
                                ? Icon(Icons.person, size: 50)
                                : null,
                          ),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () async {
                          setState(() {
                            isLoading = true;
                          });
                          await profileimg();
                          await updateStudentData();
                          setState(() {
                            isLoading = false;
                          });
                        },
                        child: Container(
                          height: height / 16,
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
    );
  }
}
