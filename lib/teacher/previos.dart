// ignore_for_file: prefer_const_constructors, use_full_hex_values_for_flutter_colors

import 'package:colleagueapp/teacher/te_previos_event_details.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Previos extends StatefulWidget {
  const Previos({super.key});

  @override
  State<Previos> createState() => _PreviosState();
}

class _PreviosState extends State<Previos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 30,left: 10),
        child: Column(
          children: [
            Row(
              children: [
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (ctx){
                      return TePreviosEventDetails();
                    }));
                  },
                  child: Container(
                    height: 45,
                    width: 380,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Color(0xffb4472B2)),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 13, left: 50),
                      child: Text("Onam festival",
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
            Padding(
        padding: const EdgeInsets.only(top: 10),
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
        ),
      ),

    );
  }
}
