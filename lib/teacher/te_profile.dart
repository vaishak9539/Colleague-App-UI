// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:colleagueapp/te_edit_profile.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TeProfile extends StatefulWidget {
  const TeProfile({super.key});

  @override
  State<TeProfile> createState() => _TeProfileState();
}

class _TeProfileState extends State<TeProfile> {
  final formkey = GlobalKey<FormState>();
  final TextEditingController profileName = TextEditingController();
  final TextEditingController profileDepartment = TextEditingController();
  final TextEditingController profilePhoneNo = TextEditingController();
  final TextEditingController profileEmailId = TextEditingController();

  Future<void> fetchTeacherDetails() async {
    try {

      SharedPreferences spref = await SharedPreferences.getInstance();
      String? teId = spref.getString("TeacherId");
      print('Shared Preference Teacher ID: $teId');
      
      if (teId!.isNotEmpty) {
        Stream<DocumentSnapshot> teacherStream = FirebaseFirestore.instance
            .collection("TeacherSign")
            .doc(teId)
            .snapshots();

        teacherStream.listen((teacherSnapshot) {
          if (teacherSnapshot.exists) {
            setState(() {
              profileName.text = teacherSnapshot["Name"] ?? '';
              profileDepartment.text = teacherSnapshot["Department"] ?? '';
              profilePhoneNo.text = teacherSnapshot["PhoneNumber"] ?? '';
              profileEmailId.text = teacherSnapshot["Email"] ?? '';
            });
          }
        });
      }
    } catch (e) {
      print('Error Fetching teacher details : $e');
    }
  }

  var size, width, height;
  @override
  void initState() {
    super.initState();
    fetchTeacherDetails();
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
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => TeProfileUpdate(),));
            }, icon:Icon(Icons.edit_square) ),
          )
        ],
      ),
      body: Form(
        key: formkey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage("assets/images/User 1.png"),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30, top: 30),
                    child: Text(
                      "Name",
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
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
                        readOnly: true,
                        controller: profileName,
                        decoration: InputDecoration(
                            // hintText: "Thomas shelby",
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
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
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
                        readOnly: true,
                        controller: profileDepartment,
                        decoration: InputDecoration(
                            // hintText: "B.come",
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
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
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
                        readOnly: true,
                        controller: profilePhoneNo,
                        decoration: InputDecoration(
                            // hintText: "9038645914",
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
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
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
                        readOnly: true,
                        controller: profileEmailId,
                        decoration: InputDecoration(
                            // hintText: "shelby@gmail.com",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6))),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: height / 17),
            ],
          ),
        ),
      ),
    );
  }
}
