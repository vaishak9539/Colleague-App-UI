// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_full_hex_values_for_flutter_colors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StNotification extends StatefulWidget {
  const StNotification({super.key});

  @override
  State<StNotification> createState() => _StNotificationState();
}

class _StNotificationState extends State<StNotification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Notification",
          style: GoogleFonts.poppins(
            textStyle:TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
          )
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
            ),
            child: Container(
              height: 150,
              width: 370,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Color(0xF4472B2),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15, top: 10),
                        child: Text(
                          "Onam",
                          style: TextStyle(
                              color: Color(0xff4472B2),
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("We are delighted to announce the upcoming Onam Program, a celebration of joy, culture, and togetherness! The college principal has approved the event, and we can't wait to make it a memorable occasion for all."),
                    ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}