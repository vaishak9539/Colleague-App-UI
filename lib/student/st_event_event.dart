// ignore_for_file: prefer_const_constructors, use_full_hex_values_for_flutter_colors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:colleagueapp/student/st_foodfestival_details.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StEventEvent extends StatefulWidget {
  const StEventEvent({super.key});

  @override
  State<StEventEvent> createState() => _StEventEventState();
}

class _StEventEventState extends State<StEventEvent> {
  var size, width, height;
  @override
  Widget build(BuildContext context) {
     size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      body:  StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("TeacherAddingEvent")
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }


              if (snapshot.hasData) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    var eventId = snapshot.data!.docs[index];
                    return Padding(
                      padding: const EdgeInsets.only(top: 15,left: 10,right: 10),
                      child: Container(
                         height: height / 16,
                         decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: Color(0xffb4472B2)),
                        child: ListTile(
                          onTap: () {
                             Navigator.push(context, MaterialPageRoute(builder: (ctx)=>StFoodFestivalDetails()));
                          },
                          title: Text(
                            eventId["EventName"],
                            style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white),
                                  )
                            ),
                        ),
                      ),
                    );
                  },
                );
              }
              return CircularProgressIndicator();
            }),
    );
  }
}
