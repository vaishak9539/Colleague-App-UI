// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_full_hex_values_for_flutter_colors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TeStudentDetails extends StatefulWidget {
  const TeStudentDetails({super.key});

  @override
  State<TeStudentDetails> createState() => _TeStudentDetailsState();
}

class _TeStudentDetailsState extends State<TeStudentDetails> {
  var size, width, height;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Student Details",
            style: GoogleFonts.poppins(textStyle: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            )),
          ),
          centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height/9,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 55,
                  backgroundImage: AssetImage("assets/images/User 1.png"),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Name",
              style: GoogleFonts.poppins(textStyle:TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400
              )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40,left: 90),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("register No",
                  style: GoogleFonts.poppins(textStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400
                  )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Text(":         0000",
                    style: GoogleFonts.poppins(textStyle: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400
                    )),
                    ),
                  ), 
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40,left: 90),
              child: Row(
                children: [
                  Text("Department",
                  style: GoogleFonts.poppins(textStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400
                  )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Text(":         B.come",
                    style: GoogleFonts.poppins(textStyle: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400
                    )),
                    ),
                  ), 
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40,left: 90),
              child: Row(
                children: [
                  Text("Phone No",
                  style: GoogleFonts.poppins(textStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400
                  )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50),
                    child: Text(":        9873457216",
                    style: GoogleFonts.poppins(textStyle: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400
                    )),
                    ),
                  ), 
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40,left: 90),
              child: Row(
                children: [
                  Text("Email ID",
                  style: GoogleFonts.poppins(textStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400
                  )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 60),
                    child: Text(":      123@gmail.com",
                    style: GoogleFonts.poppins(textStyle: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400
                    )),
                    ),
                  ), 
                ],
              ),
            ),
            SizedBox(
              height: height/8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: height/15,
                  width: width/2.2,
                 decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                   color: Color(0xffb4472B2),
                 ),
                 child: Center(child: Text("Accept",
                 style: GoogleFonts.poppins(textStyle:TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.white
                 )),
                 )),
                ),
                Container(
                  height: height/15,
                  width: width/2.2,
                 decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                   color: Color(0xffb4472B2),
                 ),
                 child: Center(child: Text("Reject",
                 style: GoogleFonts.poppins(textStyle:TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.white
                 )),
                 )),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}