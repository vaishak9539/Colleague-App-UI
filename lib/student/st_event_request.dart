// ignore_for_file: prefer_const_constructors, use_full_hex_values_for_flutter_colors, prefer_typing_uninitialized_variables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:colleagueapp/student/st_add_event.dart';
import 'package:colleagueapp/student/st_event_request_details.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StEventRequest extends StatefulWidget {
  const StEventRequest({super.key});

  @override
  State<StEventRequest> createState() => _StEventRequestState();
}

class _StEventRequestState extends State<StEventRequest> {
  var size, width, height;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("StudentsEventRequest")
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                var studentRequestID = snapshot.data!.docs[index];
                final evantName = studentRequestID["Request Event"];

                return Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
                  child: Container(
                    height: height / 16,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Color(0xffb4472B2)),
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => StEventRequestDetails(),
                            ));
                      },
                      title: Text(evantName,
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
          return Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 70),
        child: FloatingActionButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          backgroundColor: Color(0xffb4472B2),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (ctx) => StAddEvent()));
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
