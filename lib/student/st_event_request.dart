// ignore_for_file: prefer_const_constructors, use_full_hex_values_for_flutter_colors

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 30, left: 10),
        child: Column(
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (ctx) => StEventRequestDetails()));
                  },
                  child: Container(
                    height: 45,
                    width: 380,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Color(0xffb4472B2)),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 50),
                          child: Text("Holi festival",
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 170),
                          child: Text("Accept",
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              )),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  Container(
                    height: 45,
                    width: 380,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Color(0xffb4472B2)),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 50),
                          child: Text("Halloween",
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 180),
                          child: Text("Reject",
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              )),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 400,
            ),
            InkWell(
              onTap: () => Navigator.push(
                  context, MaterialPageRoute(builder: (ctx) => StAddEvent())),
              child: CircleAvatar(
                radius: 35,
                backgroundColor: Color(0xffb4472B2),
                child: Icon(
                  Icons.add,
                  size: 45,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
