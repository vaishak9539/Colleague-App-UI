// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_full_hex_values_for_flutter_colors

import 'package:colleagueapp/student/st_Home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StThankYou extends StatefulWidget {
  const StThankYou({super.key});

  @override
  State<StThankYou> createState() => _StThankYouState();
}

class _StThankYouState extends State<StThankYou> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 250,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.check_circle,
                    size: 180,
                    color: Colors.green,
                  ))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Thank You!",
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        color: Colors.green)),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Registration is successfull",
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                )),
              )
            ],
          ),
          SizedBox(
            height: 90,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 80),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                        context, MaterialPageRoute(builder: (ctx) => StHome()));
                  },
                  child: Container(
                    height: 45,
                    width: 320,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Color(0xffb4472B2)),
                    child: Center(
                      child: Text(
                        "Done",
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Colors.white)),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
