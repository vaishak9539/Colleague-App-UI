// ignore_for_file: prefer_const_constructors, use_full_hex_values_for_flutter_colors

import 'package:colleagueapp/student/st_onam_details.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StPreviousTab extends StatefulWidget {
  const StPreviousTab({super.key});

  @override
  State<StPreviousTab> createState() => _StPreviousTabState();
}

class _StPreviousTabState extends State<StPreviousTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Event",
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    ),
              )),
              centerTitle: true,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 10),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (ctx)=>StOnamDetails()));
                    },
                    child: Container(
                      height: 45,
                      width: 380,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: Color(0xffb4472B2)),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 13, left: 50),
                        child: Text("Onam Festival",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 10),
              child: Row(
                children: [
                  Container(
                    height: 45,
                    width: 380,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Color(0xffb4472B2)),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 13, left: 50),
                      child: Text("Music Festival",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
