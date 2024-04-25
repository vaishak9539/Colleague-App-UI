// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_full_hex_values_for_flutter_colors, depend_on_referenced_packages

import 'package:colleagueapp/student/st_details-details.dart';
import 'package:colleagueapp/student/st_details_photos.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class StOnamDetails extends StatefulWidget {
  const StOnamDetails({super.key});

  @override
  State<StOnamDetails> createState() => _StOnamDetailsState();
}

class _StOnamDetailsState extends State<StOnamDetails> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
         appBar: AppBar(
          title: Text("Details",
              style: GoogleFonts.poppins(
                textStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
              )),
          centerTitle: true,
        ),
        body:Column(
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
                  fontWeight:FontWeight.w500,
                  fontSize: 16
                )
              ),
              ),
               Text("Photos",
              style: GoogleFonts.poppins(
                textStyle:TextStyle(
                  fontWeight:FontWeight.w500,
                  fontSize: 16
                )
              ),
              )
            ]),
            Expanded(
              child: TabBarView(children: [
                StDetailsDetails(),StDetailsPhotos()
              ]),
            )
          ],
        ),
        
      ),
    );
  }
}
