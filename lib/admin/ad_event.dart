// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_full_hex_values_for_flutter_colors

import 'package:colleagueapp/admin/ad_previous.dart';
import 'package:colleagueapp/admin/ad_upcoming.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdEvent extends StatefulWidget {
  const AdEvent({super.key});

  @override
  State<AdEvent> createState() => _AdEventState();
}

class _AdEventState extends State<AdEvent> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Event",
            style: GoogleFonts.poppins(
                textStyle:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
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
                            fontWeight: FontWeight.bold, fontSize: 16)),
                  ),
                  Text(
                    "Previous",
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                  )
                ]),
            Expanded(child: TabBarView(children: [AdUpcoming(), AdPrevious()]))
          ],
        ),
      ),
    );
  }
}
