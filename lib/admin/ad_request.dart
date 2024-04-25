// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_full_hex_values_for_flutter_colors

import 'package:colleagueapp/admin/ad_notification.dart';
import 'package:colleagueapp/admin/ad_req_event.dart';
import 'package:colleagueapp/admin/ad_req_teacher.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdRequest extends StatefulWidget {
  const AdRequest({super.key});

  @override
  State<AdRequest> createState() => _AdRequestState();
}

class _AdRequestState extends State<AdRequest> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Request",
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
                      MaterialPageRoute(builder: (ctx) => AdNotification()));
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
                      "Teacher",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      "Event",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                  )
                ]),
            Expanded(
              child: TabBarView(children: [ReqTeacher(), ReqEvent()]),
            )
          ],
        ),
      ),
    );
  }
}
