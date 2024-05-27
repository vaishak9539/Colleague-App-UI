// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables, use_full_hex_values_for_flutter_colors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TeProfile extends StatefulWidget {
  const TeProfile({super.key});

  @override
  State<TeProfile> createState() => _TeProfileState();
}

class _TeProfileState extends State<TeProfile> {
  final formkey=GlobalKey<FormState>();
  final TextEditingController editName=TextEditingController();
  final TextEditingController editDepartment=TextEditingController();
  final TextEditingController editRegisterNo=TextEditingController();
  final TextEditingController editPhoneNo=TextEditingController();
  final TextEditingController editEmailId=TextEditingController();

  Future<void>teacherProfileEdit()async{
    await FirebaseFirestore.instance.collection("Teacher Profile").add({
      "Name" : editName.text,
      "Department" : editDepartment.text,
      "RegisterNo" : editRegisterNo.text,
      "PhoneNo" : editPhoneNo.text,
      "EmailId" : editEmailId.text,
    });

    
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
                      style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25, top: 6),
                    child: SizedBox(
                      height: height/17,
                      width: width/1.2,
                      child: TextFormField(
                        controller: editName,
                        decoration: InputDecoration(
                          hintText: "Thomas shelby",
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
                      style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25, top: 6),
                    child: SizedBox(
                      height:height/17,
                      width: width/1.2,
                      child: TextFormField(
                        controller: editDepartment,
                        decoration: InputDecoration(
                          hintText: "B.come",
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
                      style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25, top: 6),
                    child: SizedBox(
                      height: height/17,
                      width: width/1.2,
                      child: TextFormField(
                        controller: editRegisterNo,
                        decoration: InputDecoration(
                          hintText: "000000",
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
                      style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25, top: 6),
                    child: SizedBox(
                      height: height/17,
                      width: width/1.2,
                      child: TextFormField(
                        controller: editPhoneNo,
                        decoration: InputDecoration(
                          hintText: "9038645914",
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
                      style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25, top: 6),
                    child: SizedBox(
                      height: height/17,
                      width: width/1.2,
                      child: TextFormField(
                        controller: editEmailId,
                        decoration: InputDecoration(
                          hintText: "shelby@gmail.com",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6))),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height/17
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      teacherProfileEdit();
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: height/17,
                      width: width/1.2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Color(0xffb4472B2)
                    
                      ),
                      child: Center(
                        child: Text("Submit",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.white
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
    );
  }
}
