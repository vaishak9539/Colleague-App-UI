// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:colleagueapp/teacher/te_notification.dart';
import 'package:colleagueapp/teacher/te_profile.dart';
import 'package:colleagueapp/teacher/te_student_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Student extends StatefulWidget {
  const Student({super.key});

  @override
  State<Student> createState() => _StudentState();
}

class _StudentState extends State<Student> {
  Future<void> cheking() async {
    SharedPreferences spref = await SharedPreferences.getInstance();
    String? teId = spref.getString("TeacherId");
    print('Shared Preference Teacher ID: $teId');
  }

  var size, width, height;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      body: Column(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 110),
                    child: Text(
                      "Student List",
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50),
                    child: InkWell(
                      onTap: () {
                        cheking();

                        Navigator.push(context,
                            MaterialPageRoute(builder: (ctx) => TeProfile()));
                      },
                      child: SizedBox(
                        height: 25,
                        width: 25,
                        child: Image.asset("assets/images/person 1.png"),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
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
            child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("StudentSign")
                    .snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text("Error: ${snapshot.error}"));
                  }
                  if (snapshot.hasData && snapshot.data!.docs.isEmpty) {
                    return Center(
                      child: Text("No Task Addad",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontSize: 18,
                          )),
                    );
                  }
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (ctx, index) {
                          var studentId = snapshot.data!.docs[index];
                          return Padding(
                            padding: const EdgeInsets.only(left: 4, right: 4),
                            child: Card(
                              color: Colors.blue[100],
                              child: ListTile(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              TeStudentDetails(stId: studentId),
                                        ));
                                  },
                                  leading: SizedBox(
                                    width: 35,
                                    child:
                                        Image.asset("assets/images/User 1.png"),
                                  ),
                                  title: Text(
                                    studentId["Name"],
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                  subtitle: Text(
                                    studentId["Department"],
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  )),
                            ),
                          );
                        });
                  }
                  return Center(child: CircularProgressIndicator());
                }),
          )
        ],
      ),
    );
  }
}
