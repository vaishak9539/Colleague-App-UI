// ignore_for_file: prefer_const_constructors, use_full_hex_values_for_flutter_colors, prefer_const_literals_to_create_immutables

import 'package:colleagueapp/admin/ad_event_students.dart';
import 'package:colleagueapp/admin/ad_event_teacher.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReqEvent extends StatefulWidget {
  const ReqEvent({super.key});

  @override
  State<ReqEvent> createState() => _ReqEventState();
}

class _ReqEventState extends State<ReqEvent> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Column(
            children: [
              TabBar(
                  indicatorSize: TabBarIndicatorSize.tab,
                  isScrollable: true,
                  tabAlignment: TabAlignment.center,
                  indicator: BoxDecoration(
                    color: Color(0xffb4472B2),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  labelColor: Colors.white,
                  dividerColor: Colors.white,
                  tabs: [
                    Text(
                      "Students",
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500)),
                    ),
                    Text(
                      "Teacher",
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500)),
                    )
                  ]),
              Expanded(
                child:
                    TabBarView(children: [AdEventStudents(), AdEventTeacher()]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
