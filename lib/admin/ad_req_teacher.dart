// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
            stream: FirebaseFirestore.instance
                .collection("Teacher Sign")
                .snapshots(),
            builder: (ctx, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                Center(
                  child: CircularProgressIndicator(),
                );
                
              }
              return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    var teacherId = snapshot.data!.docs[index];
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage:
                            AssetImage("assets/images/User 1.png"),
                      ),
                      title: Text(
                        teacherId["name"],
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w400)),
                      ),
                      subtitle: Text(
                        teacherId["Department"],
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w400)),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              CupertinoIcons.clear_circled,
                              color: Colors.red,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 3),
                            child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.check_circle_outline,
                                  color: Colors.green,
                                )),
                          )
                        ],
                      ),
                    );
                  });
            }));
  }
}
