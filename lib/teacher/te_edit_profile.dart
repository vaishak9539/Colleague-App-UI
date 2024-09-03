// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TeProfileUpdate extends StatefulWidget {
  const TeProfileUpdate({super.key});

  @override
  State<TeProfileUpdate> createState() => _TeProfileUpdateState();
}

class _TeProfileUpdateState extends State<TeProfileUpdate> {
  var name = TextEditingController();
  var department = TextEditingController();
  var phone = TextEditingController();
  var email = TextEditingController();
  var formkey= GlobalKey<FormState>();

  XFile? pick;
  File? image;
  String? imageurl;
  bool isLoading = false; // Added isLoading variable

  Future<void> _pickImage() async {
    ImagePicker picked = ImagePicker();
    pick = await picked.pickImage(source: ImageSource.gallery);
    setState(() {
      image = File(pick!.path);
    });
  }

  Future<void> getTeacherDetails() async {
    setState(() {
      isLoading = true;
    });
    try {
      SharedPreferences spref = await SharedPreferences.getInstance();
      String? teId = spref.getString("TeacherId");
      print('Shared Preference Teacher ID: $teId');

      if (teId != null && teId.isNotEmpty) {
        DocumentSnapshot teacherSnapshot = await FirebaseFirestore.instance
            .collection("TeacherSign")
            .doc(teId)
            .get();

        if (teacherSnapshot.exists) {
          setState(() {
            name.text = teacherSnapshot["Name"];
            department.text = teacherSnapshot["Department"];
            phone.text = teacherSnapshot["PhoneNumber"];
            email.text = teacherSnapshot["Email"];
            imageurl = teacherSnapshot['imageurl'] ?? '';
          });
        }
      }
    } catch (e) {
      print('Error Fetching teacher details: $e');
      Fluttertoast.showToast(msg: "Error fetching teacher details: $e");
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
          .child('profile_image')
          .child(DateTime.now().millisecondsSinceEpoch.toString());
      await ref.putFile(image!);
      var imgurl = await ref.getDownloadURL();
      setState(() {
        imageurl = imgurl;
      });
    }
  }

  Future<void> updateTeacherData() async {
    if (name.text.isNotEmpty &&
        department.text.isNotEmpty &&
        phone.text.isNotEmpty &&
        email.text.isNotEmpty) {
      setState(() {
        isLoading = true;
      });
      try {
        SharedPreferences spref = await SharedPreferences.getInstance();
        String? teid = spref.getString("TeacherId");
        print('Shared Preference Teacher ID: $teid');

        if (teid != null && teid.isNotEmpty) {
          await FirebaseFirestore.instance
              .collection("TeacherSign")
              .doc(teid)
              .update({
            "Name": name.text,
            "Department": department.text,
            "PhoneNumber": phone.text,
            "Email": email.text,
            'imageurl': imageurl ?? '',
          });
          Fluttertoast.showToast(msg: "Profile Successfully Updated");
          Navigator.of(context).pop();
        }
      } catch (e) {
        print("Error updating teacher data: $e");
        Fluttertoast.showToast(msg: "Error updating teacher data: $e");
      } finally {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  var size, width, height;

  @override
  void initState() {
    getTeacherDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator()) // Show loading indicator
          : Form(
            key: formkey,
              child: SingleChildScrollView(
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              _pickImage();
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
                        ]),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30, top: 30),
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
                  Padding(
                    padding: const EdgeInsets.only(top: 100),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () async {
                            setState(() {
                              isLoading = true;
                            });
                            await profileimg();
                            await updateTeacherData();
                            setState(() {
                              isLoading = false;
                            });
                          },
                          child: Container(
                            width: width / 2,
                            height: height / 16,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xffb4472B2)),
                            child: Center(
                                child: Text("SAVE",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold))),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
            ),
    );
  }
}
