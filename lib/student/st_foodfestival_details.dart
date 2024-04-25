// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_full_hex_values_for_flutter_colors

import 'package:colleagueapp/student/st_thankyou.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StFoodFestivalDetails extends StatefulWidget {
  const StFoodFestivalDetails({super.key});

  @override
  State<StFoodFestivalDetails> createState() => _StFoodFestivalDetailsState();
}

class _StFoodFestivalDetailsState extends State<StFoodFestivalDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details",
            style: GoogleFonts.poppins(
              textStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
            )),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
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
                      padding: const EdgeInsets.only(left: 20, top: 10),
                      child: Text(
                        "Food Festival",
                        style: TextStyle(
                            color: Color(0xff4472B2),
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, left: 20),
                  child: Row(
                    children: [
                      Text(
                        "Date",
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 13)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 11),
                        child: Text(
                          ":   03/01/2025",
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 13)),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, left: 20),
                  child: Row(
                    children: [
                      Text(
                        "Time",
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 13)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 11),
                        child: Text(
                          ":   3:00 PM",
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 13)),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, left: 20),
                  child: Row(
                    children: [
                      Text(
                        "Location",
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 13)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 11),
                        child: Text(
                          ":   College Group",
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 13)),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 45, left: 20),
                child: Text(
                  "Participants",
                  style: GoogleFonts.poppins(
                      textStyle:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 15)),
                ),
              )
            ],
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 5,
                itemBuilder: (ctx, context) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 15),
                    child: Container(
                      width: 350,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: Color(0xffF1F6FF)),
                      child: ListTile(
                        leading: SizedBox(
                          width: 35,
                          child: Image.asset("assets/images/User 1.png"),
                        ),
                        title: Text(
                          "student Name",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                        ),
                        subtitle: Text(
                          "Department",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (ctx) => StThankYou()));
                  },
                  child: Container(
                    height: 45,
                    width: 350,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Color(0xffb4472B2)),
                    child: Center(
                      child: Text(
                        "Register",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
