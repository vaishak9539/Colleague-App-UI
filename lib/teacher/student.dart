// ignore_for_file: prefer_const_constructors

import 'package:colleagueapp/teacher/te_notification.dart';
import 'package:colleagueapp/teacher/te_profile.dart';
import 'package:colleagueapp/teacher/te_student_details.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class Student extends StatefulWidget {
  const Student({super.key});

  @override
  State<Student> createState() => _StudentState();
}

class _StudentState extends State<Student> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 120),
                    child: Text(
                      "Student List",
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 100),
                    child: InkWell(
                      onTap: () => Navigator.push(context,
                          MaterialPageRoute(builder: (ctx) => TeProfile())),
                      child: SizedBox(
                        height: 25,
                        width: 25,
                        child: Image.asset("assets/images/person 1.png"),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 19),
                    child: InkWell(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (ctx) => TeNotification())),
                      child: SizedBox(
                        height: 25,
                        width: 25,
                        child: Image.asset("assets/images/Notification 1.png"),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: (ctx, context) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 15),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(ctx, MaterialPageRoute(builder: (ctx) {
                          return TeStudentDetails();
                        }));
                      },
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
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
