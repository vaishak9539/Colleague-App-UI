// ignore_for_file: prefer_const_constructors, use_full_hex_values_for_flutter_colors, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdUpcomingFootEventDetails extends StatefulWidget {
  final adEventId;
  AdUpcomingFootEventDetails({super.key, required this.adEventId});

  @override
  State<AdUpcomingFootEventDetails> createState() =>
      _AdUpcomingFootEventDetailsState();
}

class _AdUpcomingFootEventDetailsState
    extends State<AdUpcomingFootEventDetails> {
        var size, width, height;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Event Details",
          style: GoogleFonts.poppins(
              textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              widget.adEventId["EventName"],
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffb4472B2))),
            ),
          ),
          SizedBox(
            height: height/7,
            width: width/1.4,
            child: Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          "Date",
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 14),
                        child: Text(
                          "Time",
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Text(
                          "Location",
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400)),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(":",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w400)),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(":",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w400)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(":",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w400)),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          widget.adEventId["Date"],
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 14),
                        child: Text(
                          widget.adEventId["Time"],
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Text(
                          widget.adEventId["Location"],
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
         
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: SizedBox(
              height: height/5.5,
              width: 350,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 10),
                        child: Text(
                          "Description  :",
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 15)),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10, top: 10, right: 10),
                    child: Text(
                      widget.adEventId["Description"],
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 13)),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 20),
                child: Text(
                  "Host",
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          color: Color(0xffb4472B2))),
                ),
              )
            ],
          ),
          Container(
            width: 380,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.blue[100],
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage("assets/images/User 1.png"),
              ),
              title: Text(
                "Name",
                style: GoogleFonts.poppins(
                    textStyle:
                        TextStyle(fontWeight: FontWeight.w400, fontSize: 14)),
              ),
              subtitle: Text("Department"),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 20),
                child: Text(
                  "Add Host",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: Color(0xffb4472B2)),
                  ),
                ),
              )
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 5),
                child: Container(
                  height: 58,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[200],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 300),
                    child: Icon(Icons.keyboard_arrow_down_outlined),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 45,
                width: 350,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Color(0xffb4472B2)),
                child: Center(
                  child: Text("Add Host",
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 14),
                          color: Colors.white)),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Container(
                  height: 45,
                  width: 350,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Color(0xffb4472B2)),
                  child: Center(
                    child: Text("Submit",
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 14),
                            color: Colors.white)),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
