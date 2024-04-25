// ignore_for_file: prefer_const_constructors, use_full_hex_values_for_flutter_colors

import 'package:colleagueapp/admin/ad_login.dart';
import 'package:colleagueapp/student/st_sign_in.dart';
import 'package:colleagueapp/teacher/te_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class SelectOptions extends StatefulWidget {
  const SelectOptions({super.key});

  @override
  State<SelectOptions> createState() => _SelectOptionsState();
}

class _SelectOptionsState extends State<SelectOptions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (ctx)=>AdLogin()));
                },
                child: Container(
                  height: 50,
                  width: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xffb4472B2)
                  ),
                  child: Center(
                      child: Text(
                    "Admin",
                    style: GoogleFonts.poppins(
                        textStyle:
                            TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                           color: Colors.white,
                            ),
                  )),
                ),
              ),
            ),
          ),
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: InkWell(
               onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (ctx)=>TeSignIn()));
            },
               child: Container(
                         height: 50,
                         width: 350,
                         decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xffb4472B2)
                         ),
                         child: Center(
                  child: Text(
                "Teacher",
                style: GoogleFonts.poppins(
                    textStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                       color: Colors.white,
                        ),
                         )),
                       ),
             ),
           ),
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (ctx)=>StSignIn()));
            },
             child: Container(
              height: 50,
              width: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xffb4472B2)
              ),
              child: Center(
                  child: Text(
                "Student",
                style: GoogleFonts.poppins(
                    textStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                       color: Colors.white,
                        ),
              )),
                     ),
           ),
         ),
        ],
      ),
    );
  }
}
