// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class ReqTeacher extends StatefulWidget {
  const ReqTeacher({super.key});

  @override
  State<ReqTeacher> createState() => _ReqTeacherState();
}

class _ReqTeacherState extends State<ReqTeacher> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream:
            FirebaseFirestore.instance.collection("TeacherSign").snapshots(),
        builder: (ctx, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(
              child: Text(
                "No task added",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            );
          }
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                var teacherDoc = snapshot.data!.docs[index];
                var teacherData = teacherDoc.data() as Map<String, dynamic>;
                var imageUrl = teacherData.containsKey("imageurl") &&
                        teacherData["imageurl"] != null
                    ? teacherData["imageurl"]
                    : '"assets/images/User 1.png"'; // Use a default image if imageurl is missing

                return Card(
                  color: Colors.blue[100],
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: imageUrl.startsWith('http')
                          ? NetworkImage(imageUrl)
                          : AssetImage(imageUrl) as ImageProvider,
                    ),
                    title: Text(
                      teacherData["Name"],
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    subtitle: Text(
                      teacherData["Department"],
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {
                            FirebaseFirestore.instance
                                .collection("TeacherSign")
                                .doc(teacherDoc.id)
                                .update({"Status": "rejected"});

                            Fluttertoast.showToast(
                              msg: "Rejected",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.black54,
                              textColor: Colors.white,
                              fontSize: 16.0,
                            );
                          },
                          icon: Icon(
                            CupertinoIcons.clear_circled,
                            color: Colors.red,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 3),
                          child: IconButton(
                            onPressed: () {
                              FirebaseFirestore.instance
                                  .collection("TeacherSign")
                                  .doc(teacherDoc.id)
                                  .update({"Status": "accepted"});

                                  Fluttertoast.showToast(
                              msg: "Accepted",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.black54,
                              textColor: Colors.white,
                              fontSize: 16.0,
                            );
                            },
                            icon: Icon(
                              Icons.check_circle_outline,
                              color: Colors.green,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
          return Text("data");
        },
      ),
    );
  }
}
