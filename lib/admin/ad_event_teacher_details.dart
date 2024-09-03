// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:colleagueapp/admin/ad_event_teacher.dart';
class AdEventTeacherDetails extends StatefulWidget {
  const AdEventTeacherDetails({super.key});

  @override
  State<AdEventTeacherDetails> createState() => _AdEventTeacherDetailsState();
}

class _AdEventTeacherDetailsState extends State<AdEventTeacherDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Teacher Details",
          style: GoogleFonts.poppins(
              textStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          )),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 45,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 55,
                backgroundImage: AssetImage("assets/images/User 2.png"),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Anandu",
              style: GoogleFonts.poppins(
                  textStyle:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Text(
                      "Department",
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Text(
                      "Request Event",
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Text(
                      "Date",
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Text(
                      "Time",
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400)),
                    ),
                  ),
                  Text(
                    "Location",
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400)),
                  )
                ],
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Text(
                        ":",
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w400)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Text(
                          ":",
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Text(
                          ":",
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Text(
                          ":",
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Text(
                          ":",
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400)),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: Text(
                          "Bcom",
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.w400)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: Text(
                          "Food Festival",
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.w400)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: Text(
                          "21/01/2025",
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.w400)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Text(
                          "10:00",
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.w400)),
                        ),
                      ),
                      Text(
                        "College Ground",
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.w400)),
                      ),
                    ],
                  )
                ],
              ),
            ],
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
                      "Corem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur tempus urna at turpis condimentum lobortis.",
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 13)),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 60,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(23),
                child: Container(
                  height: 50,
                  width: 170,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xffb4472B2),
                  ),
                  child: Center(
                      child: Text(
                    "Accept",
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.white)),
                  )),
                ),
              ),
              Container(
                height: 50,
                width: 170,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xffb4472B2),
                ),
                child: Center(
                    child: Text(
                  "Reject",
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.white)),
                )),
              ),
            ],
          )
        ],
      ),
    );
  }
}
