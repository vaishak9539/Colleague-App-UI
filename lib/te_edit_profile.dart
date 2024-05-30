// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, use_full_hex_values_for_flutter_colors, prefer_typing_uninitialized_variables

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TeProfileUpdate extends StatefulWidget {
  const TeProfileUpdate({super.key});

  @override
  State<TeProfileUpdate> createState() => _TeProfileUpdateState();
}

class _TeProfileUpdateState extends State<TeProfileUpdate> {
  XFile? pick;
  File? image;

  TextEditingController name = TextEditingController();
  TextEditingController department = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();

  Future<void> _pickImage() async {
    ImagePicker picked = ImagePicker();
    pick = await picked.pickImage(source: ImageSource.gallery);
    setState(() {
      image = File(pick!.path);
    });
  }

  Future<void>updateProfile()async{
    try {
      // SharedPreferences spref= await SharedPreferences.getInstance();
      // String teId = spref.getString("TeacherId");
    } catch (e) {
      
    }
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
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
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
                      backgroundImage: image != null ? FileImage(image!) : null,
                      child: image == null ? Image.asset("assets/images/User 1.png") : null,
                    ),
                    )
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
                    // controller: profileName,
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
                    // controller: profileDepartment,
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
                    // controller: profilePhoneNo,
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
                    // controller: profileEmailId,
                    decoration: InputDecoration(
                        // hintText: "shelby@gmail.com",
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
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: width/2,
                    height: height/16,
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
              ],
            ),
    );
  }
}