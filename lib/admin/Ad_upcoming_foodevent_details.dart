// ignore_for_file: prefer_const_constructors, use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdUpcomingFootEventDetails extends StatefulWidget {
  const AdUpcomingFootEventDetails({super.key});

  @override
  State<AdUpcomingFootEventDetails> createState() =>
      _AdUpcomingFootEventDetailsState();
}

class _AdUpcomingFootEventDetailsState
    extends State<AdUpcomingFootEventDetails> {
  @override
  Widget build(BuildContext context) {
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
            padding: const EdgeInsets.only(top: 30),
            child: Text(
              "Food festival",
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffb4472B2))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 70),
            child: Row(
              children: [
                Text(
                  "Date",
                  style: GoogleFonts.poppins(
                      textStyle:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 106),
                  child: Text(
                    ":        05/09/2025",
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w400)),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 70),
            child: Row(
              children: [
                Text(
                  "Time",
                  style: GoogleFonts.poppins(
                      textStyle:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 106),
                  child: Text(
                    ":      9:00 AM",
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w400)),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 70),
            child: Row(
              children: [
                Text(
                  "Location",
                  style: GoogleFonts.poppins(
                      textStyle:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 80),
                  child: Text(
                    ":      College Ground",
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w400)),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: SizedBox(
              height: 160,
              width: 370,
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 10),
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
                      "traditional genres such as folk and classical music, a music festival can be defined as a community event, with performances of singing and instrument playing, that is often presented with a theme such as a music genre ",
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
                  width: 380,
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
            height: 80,
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
