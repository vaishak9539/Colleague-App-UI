// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_full_hex_values_for_flutter_colors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StNotification extends StatefulWidget {
  const StNotification({super.key});

  @override
  State<StNotification> createState() => _StNotificationState();
}

class _StNotificationState extends State<StNotification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Notification",
          style: GoogleFonts.poppins(
            textStyle:TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
          )
        ),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("AddNotification")
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }
          if (snapshot.hasError) {
            return Center(child: Text("Error : ${snapshot.error}"));
          }
          if (snapshot.hasData && snapshot.data!.docs.isEmpty) {
            Center(child: Text("No Task Added"));
          }
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                var notificationId = snapshot.data!.docs[index];
                return Padding(
                  padding: const EdgeInsets.only(left: 8, bottom: 8, right: 8),
                  child: Container(
                    child: ListTile(
                      title: Text(
                        notificationId["EventName"],
                        style: GoogleFonts.poppins(
                            color: Color(0xffb4472B2),
                            textStyle: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 13)),
                      ),
                      subtitle: Text(notificationId["DescriptionController"]),
                    ),
                    decoration: BoxDecoration(
                      // color: Color(0xf4472B2),
                      color: Colors.blue[100],
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                );
              },
            );
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}