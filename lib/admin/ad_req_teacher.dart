// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReqTeacher extends StatefulWidget {
  const ReqTeacher({super.key});

  @override
  State<ReqTeacher> createState() => _ReqTeacherState();
}

class _ReqTeacherState extends State<ReqTeacher> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            itemCount: 6,
            itemBuilder: (ctx, index) {
              return Padding(
                padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                child: Container(
                  width: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xffF1F6FF),
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage("assets/images/User 1.png"),
                    ),
                    title: Text(
                      "Teacher Name",
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w400)),
                    ),
                    subtitle: Text(
                      "Department",
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w400)),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            CupertinoIcons.clear_circled,
                            color: Colors.red,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 3),
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.check_circle_outline,
                                color: Colors.green,
                              )),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }));
  }
}
