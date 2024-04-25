// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_full_hex_values_for_flutter_colors

import 'package:colleagueapp/student/st_event_event.dart';
import 'package:colleagueapp/student/st_event_request.dart';
import 'package:colleagueapp/student/st_notification.dart';
import 'package:colleagueapp/student/st_profile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StUpComingTab extends StatefulWidget {
  const StUpComingTab({super.key});

  @override
  State<StUpComingTab> createState() => _StUpComingTabState();
}

class _StUpComingTabState extends State<StUpComingTab> {
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
                    TextStyle(fontWeight: FontWeight.w500, fontSize: 18)),
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (ctx) => StProfile()));
                },
                child: SizedBox(
                  height: 25,
                  width: 25,
                  child: Image.asset("assets/images/person 1.png"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (ctx) => StNotification()));
                },
                child: SizedBox(
                  height: 25,
                  width: 25,
                  child: Image.asset("assets/images/Notification 1.png"),
                ),
              ),
            ),
          ],
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
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      "Event",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      "Request",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                  )
                ]),
            Expanded(
              child: TabBarView(children: [StEventEvent(), StEventRequest()]),
            )
          ],
        ),
      ),
    );
  }
}
