// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unnecessary_import, use_full_hex_values_for_flutter_colors

import 'package:colleagueapp/teacher/previos.dart';
import 'package:colleagueapp/teacher/upcoming.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class Event extends StatefulWidget {
  const Event({super.key});

  @override
  State<Event> createState() => _EventState();
}

class _EventState extends State<Event> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              TabBar(
                  isScrollable: true,
                  tabAlignment: TabAlignment.start,
                  labelColor: Color(0xffb4472B2),
                  indicatorColor: Color(0xffb4472B2),
                  dividerColor: Colors.white,
                  tabs: [
                    Text(
                      "Upcoming",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                    Text(
                      "Previos",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                  ]),
              Expanded(
                child: TabBarView(children: [Upcoming(), Previos()]),
              )
            ],
          ),
        ),
        
      ),
    );
  }
}
