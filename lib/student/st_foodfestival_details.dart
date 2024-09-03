// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_full_hex_values_for_flutter_colors, must_be_immutable, prefer_typing_uninitialized_variables, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:colleagueapp/student/st_thankyou.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StFoodFestivalDetails extends StatefulWidget {
  var passingId;
  StFoodFestivalDetails({super.key, required this.passingId});

  @override
  State<StFoodFestivalDetails> createState() => _StFoodFestivalDetailsState();
}

class _StFoodFestivalDetailsState extends State<StFoodFestivalDetails> {

  Future<void>checkRegistrationStatus()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? stid = prefs.getString("StudentUid");
      String? eventid= widget.passingId.id;

      DocumentSnapshot <Map<String, dynamic>>? registrationSnapshot = await FirebaseFirestore.instance
      .collection("StEventReg")
      .where("StId", isEqualTo: stid)
      .where("eventid", isEqualTo: eventid)
      .get()
      .then((querySnapshot) =>
       querySnapshot.docs.isNotEmpty ? querySnapshot.docs.first : null);
      
      setState(() {
        isRegistered = registrationSnapshot != null;
      });
  }

  Future<void> stEventReg() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? stid = prefs.getString("StudentUid");
      String? eventid= widget.passingId.id;
      if (!isRegistered ) {
        await FirebaseFirestore.instance.collection("StEventReg").add({
          "StId": stid,
          "eventid": eventid, // Assuming EventId is part of passingId
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Registration successful!")),
        );
        setState(() {
          isRegistered = true;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Student ID not found!")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $e")),
      );
    }
  }

    var size, width, height;
   bool isRegistered = false;
   
    @override
  void initState() {
    checkRegistrationStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Details",
            style: GoogleFonts.poppins(
              textStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
            )),
        centerTitle: true,
      ),

      body: Stack(children: [
        Column(
          children: [
            Container(
              height: height / 6,
              width: width / 1.1,
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
                          widget.passingId["EventName"],
                          style: TextStyle(
                              color: Color(0xff4472B2),
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 15, left: 25),
                            child: Text(
                              "Date",
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 13)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, left: 25),
                            child: Text(
                              "Time",
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 13)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 25, top: 15),
                            child: Text(
                              "Location",
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 13)),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10, top: 15),
                            child: Text(
                              ":",
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 13)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, left: 10),
                            child: Text(
                              ":",
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 13)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, top: 15),
                            child: Text(
                              ":",
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 13)),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 15, left: 25),
                            child: Text(
                              widget.passingId["Date"],
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 13)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, left: 25),
                            child: Text(
                              widget.passingId["Time"],
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 13)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 25, top: 15),
                            child: Text(
                              widget.passingId["Location"],
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 13)),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
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
                        textStyle: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 15)),
                  ),
                )
              ],
            ),
            Expanded(
              child: ListView.builder(
                  // shrinkWrap: true,
                  itemCount: 1,
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
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    //  Navigator.push(context,
                    //      MaterialPageRoute(builder: (ctx) => StThankYou()));
                    stEventReg();
                  },
                  child: Container(
                    height: height / 16,
                    width: width / 1.2,
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
          ),
        )
      ]),

    );
  }
}
