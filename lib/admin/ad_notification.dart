// ignore_for_file: prefer_const_constructors, sort_child_properties_last, use_full_hex_values_for_flutter_colors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:colleagueapp/admin/add_notification.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdNotification extends StatefulWidget {
  const AdNotification({super.key});

  @override
  State<AdNotification> createState() => _AdNotificationState();
}

class _AdNotificationState extends State<AdNotification> {
  var size, width, height;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Notification",
          style: GoogleFonts.poppins(
              textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
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
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            notificationId["EventName"],
                            style: GoogleFonts.poppins(
                                color: Color(0xffb4472B2),
                                textStyle: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 13)),
                          ),
                          IconButton(
                              onPressed: () {
                                var taskForUpdate = notificationId.id;
                                FirebaseFirestore.instance.collection("AddNotification").doc(taskForUpdate).delete();
                              }, icon: Icon(Icons.delete)),
                        ],
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
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: FloatingActionButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          backgroundColor: Color(0xffb4472B2),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (ctx) => AddNotification()));
          },
          child: Icon(
            Icons.add,
            size: 40,
            color: Colors.white,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
