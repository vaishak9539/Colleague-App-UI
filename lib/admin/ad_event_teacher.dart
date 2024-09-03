// ignore_for_file: prefer_const_constructors, use_full_hex_values_for_flutter_colors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:colleagueapp/admin/ad_event_teacher_details.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdEventTeacher extends StatefulWidget {
  const AdEventTeacher({super.key});

  @override
  State<AdEventTeacher> createState() => _AdEventTeacherState();
}

class _AdEventTeacherState extends State<AdEventTeacher> {
  late double height, width;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection("TeacherAddEvent")
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (snapshot.hasData && snapshot.data!.docs.isEmpty) {
            return Center(child: Text("No Task added"));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                var eventDoc = snapshot.data!.docs[index];
                return Padding(
                  padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Color(0xff4472B2),
                    ),
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (ctx) => AdEventTeacherDetails()));
                      },
                      leading: CircleAvatar(
                        radius: 17,
                        backgroundImage: AssetImage("assets/images/User 1.png"),
                      ),
                      title: Text(eventDoc["EventName"],
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          )),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
