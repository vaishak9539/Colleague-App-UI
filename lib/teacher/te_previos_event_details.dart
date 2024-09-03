// ignore_for_file: use_full_hex_values_for_flutter_colors, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:colleagueapp/teacher/previos_onam_details.dart';
import 'package:colleagueapp/teacher/previos_onam_photos.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class TePreviosEventDetails extends StatefulWidget {
  final eventid;
   TePreviosEventDetails({super.key, required this.eventid});

  @override
  State<TePreviosEventDetails> createState() => _TePreviosEventDetailsState();
}

class _TePreviosEventDetailsState extends State<TePreviosEventDetails> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Details",
          style: GoogleFonts.poppins(
            textStyle:TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500
            )
          ),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            TabBar(
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              labelColor: Color(0xffb4472B2),
              indicatorColor:Color(0xffb4472B2) ,
              dividerColor: Colors.white,
              tabs: [
              Text("Details",
              
              style: GoogleFonts.poppins(
                textStyle:TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500
                )
              ),
              ),
              Text("Photo",
              style: GoogleFonts.poppins(
                textStyle:TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500
                )
              ),
              ),
            ]),
            Expanded(
              child: TabBarView(children: [
                PreviosOnamDetails(neweventid :widget.eventid),
                PreviosOnamPhotos()
              ]),
            )
          ],
        ),
        
      ),
    );
  }
}