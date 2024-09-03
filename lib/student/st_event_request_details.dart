// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StEventRequestDetails extends StatefulWidget {
  const StEventRequestDetails({super.key});

  @override
  State<StEventRequestDetails> createState() => _StEventRequestDetailsState();
}

class _StEventRequestDetailsState extends State<StEventRequestDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Details",
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
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage("assets/images/User 2.png")),
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
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      "Department",
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      "Request Event",
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      "Date",
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
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
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text(
                          ":",
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Text(
                          ":",
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Text(
                          ":",
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Text(
                          ":",
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
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
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Text(
                          "Bcom",
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.w400)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Text(
                          "Holi Festival",
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.w400)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Text(
                          "25/03/2025",
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.w400)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Text(
                          "10:00",
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.w400)),
                        ),
                      ),
                      Text(
                        "College Hall",
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

          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 20, bottom: 10),
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
          // SizedBox(
          //   height: 60,
        ],
      ),
    );
  }
}
